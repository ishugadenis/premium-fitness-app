import 'package:flutter/material.dart';

class GoalForm extends StatefulWidget {
  //const GoalForm({Key? key}) : super(key: key);
  final addGoal;

  GoalForm(this.addGoal);

  @override
  State<GoalForm> createState() => _GoalFormState();
}

class _GoalFormState extends State<GoalForm> {
  final goalController = TextEditingController();

  final goalNumberController =TextEditingController();

  DateTime selectedDate = DateTime.now();

  void _submitData(){
    final enteredGoal = goalController.text;
    final enteredNumber = double.parse(goalNumberController.text);

    if(enteredGoal.isEmpty || enteredNumber <=0 || selectedDate ==null ){
      return;
    }
    widget.addGoal(enteredGoal, enteredNumber
      //  ,selectedDate
    );
    Navigator.of(context).pop();
  }
  void _presentDatePicker(){
    showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if(pickedDate == null){
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });

    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Goal'),
              controller: goalController,
              onSubmitted: (_)=>_submitData(),

            ),
            TextField(
              decoration: InputDecoration(labelText: 'Goal number'),
              controller: goalNumberController,
              onSubmitted: (_)=>_submitData,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  padding: EdgeInsets.all(8),
                  onPressed: () => _submitData(),
                  child: Text('START',
                    style: TextStyle(
                      fontSize: 24,
                    ),)),
            )
          ],
        ),
      ),
    );
  }
}