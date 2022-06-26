 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wkt_categories.dart';
import '../providers/exercise.dart';

class SpecificExercise extends StatelessWidget {
  //const SpecificExercise({Key? key}) : super(key: key);
     static const routeName = './specific-workout-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as dynamic;
    final spExercise =Provider.of<Exercises>(context).list.firstWhere((element)
    => element.id == routeArgs);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(spExercise.title),
      ),
      body:Container(
      height: MediaQuery.of(context).size.height* 0.5,
      width:  double.infinity,
      child: Image.network(spExercise.imageUrl,
      fit: BoxFit.contain),
    ),
    );
  }
}
