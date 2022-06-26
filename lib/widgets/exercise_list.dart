import 'package:flutter/material.dart';
import 'package:premium_fitness_app/providers/exercise.dart';
import 'package:premium_fitness_app/providers/workout_categories.dart';
import 'package:premium_fitness_app/widgets/exercise_holder.dart';
import 'package:provider/provider.dart';
import '../providers/wkt_categories.dart';

// class ExerciseList extends StatelessWidget {
//  // const ExerciseList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//
//        final exerciseData = Provider.of<Exercises>(context).list.
//        where((element) => element.category == Provider.of<Categories>(context).levels)
//            .toList();
//        return ListView.builder(
//          itemCount: exerciseData.length,
//          itemBuilder: (ctx, i) =>
//              ChangeNotifierProvider.value(
//                  value: exerciseData[i],
//                  key: ValueKey('exlist'),
//                  child: ExerciseHolder(),
//              ),
//        );
//   }
// }
