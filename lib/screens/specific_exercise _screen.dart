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
    final spTitle =routeArgs['title']??'';
    final spExercise = routeArgs['imageUrl'] ?? '';
    final spDescrption =routeArgs['description'] ??'';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(spTitle),
      ),
      body:Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height* 0.5,
            width:  double.infinity,
            child: Image.network(spExercise,
               fit: BoxFit.contain),
              ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                 end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xFFE3D2C4),
                  Color(0xFFFDFCFB),
                ]
              )
            ),
            child:Text(spDescrption,
            ),
          )
        ],
      ),
    );
  }
}
