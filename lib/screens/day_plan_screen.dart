import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:premium_fitness_app/screens/set_workout_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../blocs/database_service.dart';
import '../models/plan.dart';
import '../widgets/plan_holder.dart';

class DayPlan extends StatefulWidget {
  const DayPlan({Key? key}) : super(key: key);
  static const routeName = './day-plan';

  @override
  _DayPlanState createState() => _DayPlanState();
}

class _DayPlanState extends State<DayPlan> {
  // late String dayname;
   late DbService _dbService;

   @override
  void initState() {
     _dbService = DbService() ;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final categoryTitle = routeArgs['day'];
    //final categoryId = routeArgs['dayId'];
   // dayname =_dbService.dayName;
    _dbService.dayName =categoryTitle;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(categoryTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(SetWorkout.routeName, arguments:
              {
                'day':_dbService.dayName,
              });
            },
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          )
        ],
      ),
     body: StreamBuilder<List<Plan>>(
       stream: _dbService.plans(),
       builder: (context, snapshot) {
         if(snapshot.connectionState == ConnectionState.waiting)
           return Center(child: CircularProgressIndicator()
           );

         final PlanSnap = snapshot.data;

         return SingleChildScrollView(
           child: Column(
             children:
               PlanSnap!.map((e) {
                return PlanHolder(
                    e.bodyPartImage,
                    e.exerciseImage,
                    e.exerciseName,
                    e.day,
                   e.sets,
                  e.reps
                );
               }).toList(),

           ),
         );

       }
     )
    );
  }
}
