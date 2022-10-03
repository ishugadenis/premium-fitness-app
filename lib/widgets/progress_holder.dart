import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/goals.dart';
import 'update_form.dart';

class ProgressHolder extends StatelessWidget {
  Goal goal;

  ProgressHolder({required this.goal});

  @override
  Widget build(BuildContext context) {
     updateGoal({required BuildContext context,required  Goal goal}) {
      showModalBottomSheet(
          context: context,

          builder: (context) {
            return UpdateForm(goal: goal,);
          });
    }

    final g = Provider.of<Goal>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: GestureDetector(
        onTap: () => updateGoal(context: context,goal: goal ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0XDBB8BCff),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd('en_US').format(g.dateSet),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    g.goalName,
                    style: TextStyle(
                        color: Colors.white, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    // g.currentWeight,
                    goal.currentWeight,
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    g.targetWeight,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
