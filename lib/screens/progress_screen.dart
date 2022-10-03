import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:premium_fitness_app/widgets/progress_list.dart';
import 'package:premium_fitness_app/widgets/radial_progress.dart';
import 'package:provider/provider.dart';
import '../providers/goals.dart';
import '../widgets/progress_holder.dart';
import '../widgets/update_form.dart';
import '../blocs/progresspage_bloc.dart';
import '../widgets/top_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProgressScreen extends StatefulWidget {

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {


  // final List<Goal> _userGoals=[];
  //
  // List<Goal> get _recentGoals{
  //   return _userGoals.where((g) {
  //     return g.date.isAfter(DateTime.now().subtract(Duration(days: 30),
  //     ),
  //     );
  //   }).toList();
  // }
  // void _addNewGoal(String uGoal,     double uGoalNumber){
  //   final newGoal = Goal(
  //     goal: uGoal,
  //     goalNo: uGoalNumber,
  //     date: DateTime.now(),
  //     isComplete: false,
  //
  //   );
  //
  //   setState(() {
  //     _userGoals.add(newGoal);
  //   });
  // }
  Goal emptygoal=Goal(
    currentWeight: "",
  dateSet:DateTime.now(),
    goalId: DateTime.now().toString(),
    goalName: "",
    targetWeight: ""
  );

  late ProgressPageBloc _progressPageBloc;

  @override
  void initState() {
    _progressPageBloc = ProgressPageBloc();

    super.initState();
  }

  @override
  void dispose() {
    _progressPageBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void updateGoal() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return UpdateForm(goal: emptygoal,);
          });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    TopBar(),
                    Positioned(
                      top: 30,
                      left: 0.0,
                      right: 0.0,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              _progressPageBloc.subtractDate();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                          StreamBuilder<dynamic>(
                              stream: _progressPageBloc.dateStream,
                              initialData: _progressPageBloc.selectedDate,
                              builder: (context, snapshot) {
                                return Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        DateFormat("EEEE")
                                            .format(snapshot.data),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        DateFormat("MMM  d y")
                                            .format(snapshot.data),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          Transform.rotate(
                            angle: 135.0,
                            child: IconButton(
                              onPressed: () {
                                _progressPageBloc.addDate();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),

                RadialProgress(),

                ProgressList(),
                // _userGoals
              ],
            ),
            Positioned(
              right: MediaQuery.of(context).size.width * 0.35,
              left: MediaQuery.of(context).size.width * 0.35,
              bottom: 20,
              child: IconButton(
                onPressed: updateGoal,
                icon: FaIcon(FontAwesomeIcons.penToSquare,
                    size: 30, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
