import 'package:flutter/material.dart';
import 'package:premium_fitness_app/screens/todo_screen.dart';
import '../widgets/uplan_list.dart';
import 'package:provider/provider.dart';
import '../providers/workout_categories.dart';

class WorkoutPlan extends StatefulWidget {
  const WorkoutPlan({Key? key}) : super(key: key);

  @override
  State<WorkoutPlan> createState() => _WorkoutPlanState();
}

String value = "";

class _WorkoutPlanState extends State<WorkoutPlan> {
  @override
  Widget build(BuildContext context) {
    // return const Scaffold(

    //   body: UplanList(),
    // );
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              items: const [
                DropdownMenuItem<String>(
                  value: "1",
                  child: Center(
                    child: Text('one'),
                  ),
                ),
                DropdownMenuItem<String>(
                    value: "2",
                    child: Center(
                      child: Text('Two'),
                    ))
              ],
              onChanged: (_value) => {
                print(_value.toString()),
                setState(() {
                  value = _value!;
                }),
              },
              hint: Text('Select any number'),
            ),
            Text(
              "$value",
            )
          ],
        ),
      ),
    );
  }
}
