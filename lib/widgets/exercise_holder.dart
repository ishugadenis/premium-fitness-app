import 'package:flutter/material.dart';
import 'package:premium_fitness_app/screens/specific_exercise%20_screen.dart';
import 'package:provider/provider.dart';
import '../models/exerciseDb.dart';
import '../providers/exercise.dart';

class ExerciseHolder extends StatelessWidget {
  //const ExerciseHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final exercise = Provider.of<ExerciseDb>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SpecificExercise.routeName, arguments: {
              'title':exercise.title,
              'imageUrl': exercise.imageUrl,
              'description':exercise.description,
        });
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
                      exercise.title,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(exercise.equipments,
                        overflow: TextOverflow.clip,
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        )),
                    // Text('66666',
                    //     overflow: TextOverflow.clip,
                    //     style: const TextStyle(
                    //       color: Colors.black,
                    //     ))
                  ],
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Image.network(exercise.imageUrl),
            ],
          ),
        ),
      ),
    );
  }
}
