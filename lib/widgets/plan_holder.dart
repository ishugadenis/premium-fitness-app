import 'package:flutter/material.dart';
import 'package:premium_fitness_app/screens/specific_exercise%20_screen.dart';
import 'package:provider/provider.dart';
import '../models/plan.dart';

class PlanHolder extends StatelessWidget {
  //const ExerciseHolder({Key? key}) : super(key: key);
   String bodyPartImage;
   String exerciseImage;
   String exerciseName;
   String day;
   String reps;
   String sets;

   PlanHolder(this.bodyPartImage, this.exerciseImage,
      this.exerciseName,
       this.day, this.reps, this.sets);

  @override
  Widget build(BuildContext context) {
    //final plan = Provider.of<Plan>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SpecificExercise.routeName, arguments:day );
      },
      child: Card(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Color(0xFFE3D2C4),
                  Color(0xFFFDFCFB),
                ],
              )

          ),
          height: 100,
          width: double.infinity,
          margin: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      exerciseName,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('$sets sets',
                        //exercise.equipments,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    Text('$reps reps',
                        //exercise.reps,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          color: Colors.black,
                        ))
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Image.network(exerciseImage),
            ],
          ),
        ),
      ),
    );
  }
}
