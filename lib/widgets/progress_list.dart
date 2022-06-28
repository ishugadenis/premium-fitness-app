import 'package:flutter/material.dart';
import '../providers/goal.dart';
import 'package:intl/intl.dart';

class ProgressList extends StatelessWidget {
 //const ProgressList({Key? key}) : super(key: key);

  final List<Goal>  _userGoals;

  ProgressList(this._userGoals);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.25,
      width: double.infinity,
      child:ListView.builder(itemBuilder: (ctx, i)

      {
        return Card(
          child: Container(
            height: MediaQuery.of(context).size.height*0.1,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(DateFormat.yMMMMd().format(_userGoals[i].date).toString(),
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:FontWeight.bold,
                            color: Colors.blueAccent,
                          )),
                          Text(_userGoals[i].isComplete.toString(),
                          style: TextStyle(
                            fontSize:19,
                            fontStyle:FontStyle.italic,
                          ),),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(_userGoals[i].goal,
                            style: TextStyle(
                              fontSize:19,
                              fontStyle:FontStyle.normal,
                            ),),
                          Text(_userGoals[i].goalNo.toString()),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

      },
      itemCount:_userGoals.length ,
      ),
    );
  }
}
