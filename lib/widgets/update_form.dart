import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/goals.dart';

class UpdateForm extends StatefulWidget {
  Goal goal;

  UpdateForm(
      {required this.goal}); // const UpdateForm({Key? key}) : super(key: key);

  @override
  _UpdateFormState createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  var Es;
  final List<String> weightGoal= ['Gain weight', 'Loose weight'];
  final _formKey = GlobalKey<FormState>();

  var _updatedGoal = Goal(
      dateSet: DateTime.now(),
      //dayNumber: 1,
      currentWeight: '',
      targetWeight: '',
      goalName: '',
      goalId: '');

 late var _initValues = {
    'currentWeight': widget.goal.currentWeight,
    'date': DateTime.now().toString(),
    'targetWeight': widget.goal.targetWeight,
    'goalName':widget.goal.goalName
  };
  var _isInit = true;

  void _saveForm() {
    final _isValid = _formKey.currentState?.validate();
    if (!_isValid!) {
      print("error");
      return;
    }
    print("saved");
    _formKey.currentState?.save();
    if (widget.goal.currentWeight != "") {
      print("ne data");
        Provider.of<Goals>(context, listen: false)
          .updateGoal(widget.goal.goalId, _updatedGoal);
      Navigator.of(context).pop();
    } else {
      Provider.of<Goals>(context, listen: false).addProduct(_updatedGoal);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Update Progress',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: _initValues['currentWeight'],
            decoration: InputDecoration(labelText: 'current weight'),
            validator: (val) =>
                val!.isEmpty ? 'Please enter current weight' : null,
            onSaved: (val) {
              _updatedGoal = Goal(
                dateSet: DateTime.now(),
                currentWeight: val!,
                targetWeight: _updatedGoal.targetWeight,
                goalName: _updatedGoal.goalName,
                //dayNumber: _updatedGoal.dayNumber,
                goalId: _updatedGoal.goalId,
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          DropdownButtonFormField(
            value: Es,
                //?? _initValues['goalName'],
            decoration: InputDecoration(labelText: 'Gain/Loose'),
            items: weightGoal.map((goal) {
              return DropdownMenuItem(
                value: goal,
                child: Text(goal),
              );
            }).toList(),
            onChanged: (val) => setState(() => Es = val ),
            onSaved: (val){
              _updatedGoal = Goal(
                dateSet: DateTime.now(),
                currentWeight: _updatedGoal.currentWeight,
                targetWeight: _updatedGoal.targetWeight,
                goalName: Es,
                //dayNumber: _updatedGoal.dayNumber,
                goalId: _updatedGoal.goalId,
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: _initValues['date'],
            decoration: InputDecoration(labelText: 'current Date'),
            validator: (val) =>
                val!.isEmpty ? 'Please enter current Date' : null,
            onSaved: (val) {
              _updatedGoal = Goal(
                dateSet: DateTime.now(),
                currentWeight: _updatedGoal.currentWeight,
                targetWeight: _updatedGoal.targetWeight,
                goalName: _updatedGoal.goalName,
               // dayNumber: _updatedGoal.dayNumber,
                goalId: _updatedGoal.goalId,
              );
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            initialValue: _initValues['targetWeight'],
            decoration: InputDecoration(labelText: 'Target weight'),
            validator: (val) =>
                val!.isEmpty ? 'Please enter Target weight' : null,
            onSaved: (val) {
              _updatedGoal = Goal(
                dateSet: DateTime.now(),
                currentWeight: _updatedGoal.currentWeight,
                targetWeight: val!,
                goalName: _updatedGoal.goalName,
               // dayNumber: _updatedGoal.dayNumber,
                goalId: _updatedGoal.goalId,
              );
            },
          ),
          // Slider(
          //   value: 40,
          //   activeColor: Colors.pink,
          //   inactiveColor: Colors.grey,
          //   min: 0,
          //   max: 100,

          //   divisions: 100,
          //   onChanged: null,
          //   // (val)=> setState(() {
          //   //   _currentWeight = val.round();
          //   // }),
          // ),
          RaisedButton(
            onPressed: _saveForm,
            color: Colors.black,
            child: Text('Update'),
          )
        ],
      ),
    );
  }
}
