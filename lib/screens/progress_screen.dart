import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:premium_fitness_app/themes/radial_progress.dart';
import '../blocs/progresspage_bloc.dart';
import '../widgets/top_bar.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({Key? key}) : super(key: key);

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {

 late ProgressPageBloc _progressPageBloc;
  @override
  void initState() {
    _progressPageBloc =ProgressPageBloc();
    super.initState();
  }
  @override
  void dispose() {
    _progressPageBloc.dispose();
    super.dispose();
  }

  void _setGoal(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        onTap: (){},
        behavior: HitTestBehavior.opaque,
        child:GoalForm(),);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: <Widget>[
          Column(
            children:<Widget> [
              Stack(
                children:<Widget> [
                  TopBar(),
                  Positioned(
                    top: 30,
                    left: 0.0,
                    right: 0.0,
                    child: Row(
                      children:<Widget> [
                        IconButton(
                          onPressed: (){
                            _progressPageBloc.subtractDate();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 35,
                            color: Colors.white,
                          ),

                        ),
                        StreamBuilder<dynamic>(
                            stream: _progressPageBloc.dateStream,
                            initialData: _progressPageBloc.selectedDate,
                            builder: (context, snapshot) {
                              return Expanded(
                                child: Column(
                                  children:  <Widget>[
                                    Text(
                                      DateFormat("EEEE").format(snapshot.data),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:24.0,
                                        color: Colors.white,

                                      ),
                                    ),
                                    Text(
                                      DateFormat("MMM  d y").format(snapshot.data),
                                      style:const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize:24.0,
                                        color: Colors.white,

                                      ),
                                    ),

                                  ],
                                ),
                              );
                            }
                        ),
                        Transform.rotate(
                          angle: 135.0,
                          child: IconButton(
                            onPressed: (){
                              _progressPageBloc.addDate();
                            },
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              size: 35,
                              color: Colors.white,
                            ),

                          ),
                        ),
                      ],
                    ),

                  )
                ],
              ),
              RadialProgress(),
              MonthlyListing(),
            ],
          ) ,
          Positioned(
            right: 0,
            left: 0,
            bottom: 20,
            child: FloatingActionButton(
              child: Icon(
                Icons.add
              ),
              onPressed: () => _setGoal(context),
            ),
          )
        ],
      )

    );
  }

}

 class MonthlyListing extends StatelessWidget {
   const MonthlyListing({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Flexible(
       child: Padding(
         padding: const EdgeInsets.all(15.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children:<Widget> [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.max,
               children:<Widget> [
                 MonthlyStatusRow('February 2019', 'Ongoing'),
                 MonthlyStatusRow('January 2019', 'Complete'),
                 MonthlyStatusRow('December, 2018', 'Complete'),

               ],
             ),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisSize: MainAxisSize.max,
               children: <Widget>[
                 MonthlyTargetRow('Gain weight', '55kg'),
                 MonthlyTargetRow('Lose weight', '57kg'),
                 MonthlyTargetRow('Gain weight', '44kg'),
               ],
             ),
           ],
         ),
       ),
     );
   }
 }

class MonthlyStatusRow extends StatelessWidget {
  final String monthYear, status;

  MonthlyStatusRow(this.monthYear, this.status);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            monthYear,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          Text(
            status,
            style: TextStyle(
                color: Colors.grey,
                fontStyle: FontStyle.italic,
                fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class MonthlyTargetRow extends StatelessWidget {
  final String target, targetAchieved;

  MonthlyTargetRow(this.target, this.targetAchieved);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            target,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          Text(
            targetAchieved,
            style: TextStyle(color: Colors.grey, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}

class GoalForm extends StatelessWidget {
  //const GoalForm({Key? key}) : super(key: key);

  final goalController = TextEditingController();
  final goalNumberController =TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Goal'),
              controller: goalController,
            ),
            TextField(
               decoration: InputDecoration(labelText: 'Goal number'),
              controller: goalNumberController,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FlatButton(
                  padding: EdgeInsets.all(8),
                  onPressed: (){
                    print(goalController.text);
                  },
                  child: Text('START',
                  style: TextStyle(
                    fontSize: 24,
                  ),)),
            )
          ],
        ),
      ),
    );
  }
}

