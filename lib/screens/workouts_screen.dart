import 'package:flutter/material.dart';
import 'package:premium_fitness_app/providers/exercise.dart';
import 'package:premium_fitness_app/providers/wkt_categories.dart';
import 'package:premium_fitness_app/widgets/exercise_holder.dart';
import '../providers/wkt_categories.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatelessWidget {
  //const WorkoutScreen({Key? key}) : super(key: key);

  static const routeName = './workouts-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as dynamic;
    final category = Provider.of<Categories>(context).levels.firstWhere(
          (cat) => cat.id == routeArgs,
        );
    final exerciseData = Provider.of<Exercises>(context)
        .list
        .where((element) => element.category == routeArgs)
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(category.title),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              child: Image.network(
                category.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: ListView.builder(
              itemCount: exerciseData.length,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: exerciseData[i],
                key: const ValueKey('exlist'),
                child: ExerciseHolder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
