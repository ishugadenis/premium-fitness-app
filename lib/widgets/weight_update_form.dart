import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:premium_fitness_app/models/weight_tack_entry.dart';
import 'package:date_time_picker/date_time_picker.dart';


class WeightUpdateForm extends StatefulWidget {
  const WeightUpdateForm({Key? key}) : super(key: key);

  @override
  _WeightUpdateFormState createState() => _WeightUpdateFormState();
}

class _WeightUpdateFormState extends State<WeightUpdateForm> {
//DateTime _selectedDate = DateTime.now();
var _selectedDate;

  void _presentDatePicker(){
    showDatePicker(context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now()
    ).then((pickedDate){
      if(pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate =pickedDate;
      });
    });
  }
  void _submitData() async{
   // var uid =FirebaseAuth.instance.currentUser!.uid;
    //Timestamp _myTimeStamp = Timestamp.fromDate(_selectedDate);
    await FirebaseFirestore.instance.collection('progress').add(
      {
        'currentWeight': currentWeight,
        'date':Timestamp.fromDate(_selectedDate),
        'userId':FirebaseAuth.instance.currentUser!.uid,
      }
    );
    Navigator.of(context).pop();
  }

  DateTime _dateTimeValue = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  var currentWeight;
  var date;
  @override
  Widget build(BuildContext context) {
    final dateTimeFormat =DateFormat("yyyy-MM-dd");
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
           TextFormField(
            decoration: const InputDecoration(
            labelText: "Current Weight (Kgs)",),
               //hintText: "Please enter your current weight"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your current weight";
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                currentWeight = int.parse(value);
              });

            },
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(_selectedDate == null ? "No Date choosen":
                'Picked Date:${DateFormat.yMd().format(_selectedDate)}'),
               FlatButton(
                   onPressed: _presentDatePicker,
                   child: Text(
                     'Choose Date', style: TextStyle(fontWeight: FontWeight.bold),
                   ))
              ],
            ),
          ),

          RaisedButton(
            child: Text('Submit'),
            color: Colors.black,
            onPressed:(){
              _submitData();
              print(currentWeight);
              print(_selectedDate);
            },

          )
          ],
        ),
      ),
    );
  }
}
