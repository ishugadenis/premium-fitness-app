import 'package:flutter/material.dart';
import '../providers/goal.dart';

class ProgressList extends StatelessWidget {
 //const ProgressList({Key? key}) : super(key: key);

  final List<Goal>  _userGoals;

  ProgressList(this._userGoals);


  //final List<Goal> _userGoals ;


  // =[
  //   Goal(
  //     goal: 'gain weight',
  //     goalNo: 44,
  //     date: DateTime.now(),
  //     isComplete: false
  //   ),
  //   Goal(
  //       goal: 'gain weight',
  //       goalNo: 44,
  //       date: DateTime.now(),
  //       isComplete: false
  //   )
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      child:ListView.builder(itemBuilder: (ctx, i)

      {
        return Card(
          child: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      children: <Widget>[
                        Text(_userGoals[i].date.toString()),
                        Text(_userGoals[i].isComplete.toString()),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(_userGoals[i].goal),
                        Text(_userGoals[i].goalNo.toString()),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );

      },
      itemCount:_userGoals.length ,
      ),
    );
  }
}
