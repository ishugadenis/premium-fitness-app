import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/exercise.dart';
import '../providers/workout_categories.dart';

class UplanHolder extends StatelessWidget {
  //const UplanHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final up = Provider.of<Exercise>(context) ;

    return Card(
      child: Container(
        child: Row(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: Image.network(up.imageUrl, fit: BoxFit.cover),
          ),
          Column(
            children: <Widget>[
              Text(up.title),
              Text(up.reps),
            ],
          )
        ]),
      ),
    );
  }
}
