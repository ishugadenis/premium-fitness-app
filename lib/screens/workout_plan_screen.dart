import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../screens/day_plan_screen.dart';
import '../widgets/categories_list.dart';
import 'package:provider/provider.dart';
import '../providers/workout_categories.dart';

class WorkoutPlan extends StatefulWidget {
  @override
  State<WorkoutPlan> createState() => _WorkoutPlanState();
}

class _WorkoutPlanState extends State<WorkoutPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          DayHolder('Monday', '001'),
          DayHolder('Tuesday', '002'),
          DayHolder('Wednesday', '003'),
          DayHolder('Thursday', '004'),
          DayHolder('Friday', '005'),
          DayHolder('Saturday', '006'),
        ],
      ),
    );
    //CategoriesList(),
  }
}

class DayHolder extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  final String day;
  final String dayId;

  DayHolder(this.day, this.dayId);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(DayPlan.routeName, arguments: {
          'day':day,
          'dayId':dayId,

        });
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.calendar_today,
                  size: 30,
                  color:Color(0xFFE3D2C4),
                ),
              ),
              Container(
               // width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(day,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 21)),
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black54,
          ),
        ],
      ),
    );
  }
}
