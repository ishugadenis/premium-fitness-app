import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:premium_fitness_app/blocs/database_service.dart';
import 'package:premium_fitness_app/models/weight_tack_entry.dart';
import 'package:premium_fitness_app/widgets/weight_update_form.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/goalsDb.dart';

import 'datetime_chart.dart';

class UserProgress extends StatefulWidget {
  const UserProgress({Key? key}) : super(key: key);

  @override
  _UserProgressState createState() => _UserProgressState();
}

class _UserProgressState extends State<UserProgress> {
 //bool myStateVariable =true;


  void updateGoal() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return WeightUpdateForm();
        });
  }

  final uid = FirebaseAuth.instance.currentUser?.uid;
  var collection = FirebaseFirestore.instance.collection('goals');

  Future isTarget() async {
    var collection = FirebaseFirestore.instance.collection('goals');
    var docSnapshot = await collection.doc(
        FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (docSnapshot.exists) {
      Map <String, dynamic>? data = docSnapshot.data();
      var value = data?['isTargetSet'];
       _isTargetSet =value;
       // setState(() {
       //
       // });
     // print(_isTargetSet);
      return _isTargetSet;
    }
  }

   late Timer timer;
   var _isTargetSet ;
  var _targetWeight;

  // void _submitTarget() {
  //   FirebaseFirestore.instance.collection('goals').doc(uid).set(
  //       {
  //         'TargetWeight': _targetWeight,
  //         'isTargetSet': _isTargetSet,
  //         'userId': uid,
  //       }
  //   );
  //   setState(() {
  //     x = ! x;
  //   });
  // }

  late DbService _dbService;

  @override
  void initState() {
    isTarget();
    _dbService = DbService();
       timer= Timer(Duration(seconds: 2),(){
       _isTargetSet = isTarget().toString() == 'true' ? true : false ;
         setState(() {
           isTarget();
         });
       });


    //print(_isTargetSet.toString() + "ff");
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    timer.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(isTarget().toString());
    //print(json.decode(isTarget()));
    print(_isTargetSet.toString() + "ff");
    //var x =(isTarget().toString() == 'true' ? true: false);
   // t= x;
    //print(t.toString() +"rr");
    return Scaffold(

        body: _isTargetSet ?
        //_isTargetSet ?
        Center(child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          height: 200,
          child: Column(
            children: [
              Text('Set Weight Goal'),
              TextField(
                decoration: InputDecoration(
                    label: Text('Target Weight (Kgs)')
                ),
                onChanged: (value) {
                  setState(() {
                    _targetWeight = value;
                  });
                },
              ),
              SizedBox(height: 20,),
              RaisedButton(
                  child: Text("Set"),
                  color: Colors.black,
                  onPressed: () {
                    //_submitTarget();
                    setState(() {
                      _isTargetSet = !_isTargetSet;
                    });
                    FirebaseFirestore.instance.collection('goals').doc(uid).set(
                        {
                          'TargetWeight': _targetWeight,
                          'isTargetSet': _isTargetSet,
                          'userId': uid,
                        }
                    );

                  })
            ],

          ),
        )) :
        SingleChildScrollView(
          child: StreamBuilder<List<WeightTrackEntry>>(
              stream: _dbService.progress(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                if (snapshot.connectionState == ConnectionState.none)
                  return Text(' nothing to show');
                final Snap = snapshot.data;
                final List<WeightTrackEntry> we = Snap!.toList();

                return Column(children: [
                  //Initialize the chart widget
                  SfCartesianChart(

                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Weight progress'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series:
                      //Snap!.map((e) =>
                      <ChartSeries<WeightTrackEntry, String>>[

                        LineSeries<WeightTrackEntry, String>(
                            dataSource: we,
                            xValueMapper: (WeightTrackEntry weight, _) =>
                                DateFormat.MMMd('en_US').format(
                                    weight.date.toDate()),
                            yValueMapper: (WeightTrackEntry weight, _) =>
                            weight.currentWeight,
                            name: 'Weight',
                            // Enable data label
                            dataLabelSettings: DataLabelSettings(
                                isVisible: true)
                        )

                      ]
                    //).toList(),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 0, vertical: 20),
                    child: RaisedButton(
                      color: Colors.black,
                      child: Text("Add CurrentWeight"),
                      onPressed: updateGoal,
                    ),
                  )

                  // Expanded(
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     //Initialize the spark charts widget
                  //     child: SfSparkLineChart.custom(
                  //       //Enable the trackball
                  //       trackball: SparkChartTrackball(
                  //           activationMode: SparkChartActivationMode.tap),
                  //       //Enable marker
                  //       marker: SparkChartMarker(
                  //           displayMode: SparkChartMarkerDisplayMode.all),
                  //       //Enable data label
                  //       labelDisplayMode: SparkChartLabelDisplayMode.all,
                  //       xValueMapper: (int index) => data[index].year,
                  //       yValueMapper: (int index) => data[index].sales,
                  //       dataCount: 5,
                  //     ),
                  //   ),
                  // )
                ]
                );
              }
          ),
        )
    );
  }

}