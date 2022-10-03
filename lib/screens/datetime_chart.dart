// import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../models/weight_tack_entry.dart';
// import '../blocs/database_service.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:firebase_database/firebase_database.dart';
//
// class DateTimeChart extends StatefulWidget {
//   const DateTimeChart({Key? key}) : super(key: key);
//
//   @override
//   _DateTimeChartState createState() => _DateTimeChartState();
// }
//
// class _DateTimeChartState extends State<DateTimeChart> {
//   late List<WeightTrackEntry>? _data = null;
//   static List<charts.Series<WeightTrackEntry, DateTime>>? _chartData = null;
//   String productName = 'Add Food';
//   late WeightTrackEntry addWeightTrack;
//   DateTime _dateTimeValue = DateTime.now();
//   final _addWeightKey = GlobalKey<FormState>();
//   DbService dbService =new DbService();
//
//   Widget _addWeightButton(){
//     return IconButton(
//         icon: Icon(Icons.add_box),
//         iconSize: 25,
//          color: Colors.white,
//          onPressed: ()async{
//           setState(() {
//             _showWeightToAdd(context);
//           });
//          } );
//   }
//   _showWeightToAdd(BuildContext context){
//     return showDialog(
//       context: context,
//       builder: (context){
//         return AlertDialog(
//           title: Text(productName),
//           content: _showAmountHad(),
//           actions:<Widget> [
//             FlatButton(
//               onPressed: () => Navigator.pop(context), // passing false
//               child: Text('Cancel'),
//             ),
//             FlatButton(
//               onPressed: () async {
//                 Navigator.pop(context);
//                 addWeightTrack.date = _dateTimeValue;
//                 await dbService.addWeightTrackData(addWeightTrack);
//                 fetchChartData();
//               },
//               child: Text('Ok'),
//             ),
//           ],
//         );
//       }
//     );
//   }
//    Widget _showAmountHad(){
//     return new Scaffold(
//       body: Column(children: [
//         _showAddWeightForm(),
//       ],),
//     );
//    }
//    Widget _showAddWeightForm(){
//     final dateTimeFormat =DateFormat("yyyy-MM-dd");
//     return Form(
//      key:_addWeightKey,
//      child: Column(
//        children: [
//          TextFormField(
//          decoration: const InputDecoration(
//          labelText: "Current Weight",
//              hintText: "Please enter your current weight"),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return "Please enter your current weight";
//             }
//             return null;
//           },
//           onChanged: (value) {
//             addWeightTrack.currentWeight = int.parse(value);
//             print(addWeightTrack.currentWeight);
//           },
//         ),
//          DateTimeField(
//            format: dateTimeFormat,
//            decoration: InputDecoration(labelText: "Date: "),
//            onShowPicker: (context, currentValue) async {
//              _dateTimeValue = await showDatePicker(
//                  context: context,
//                  initialDate: DateTime.now(),
//                  firstDate: DateTime(1900),
//                  lastDate: DateTime(2100)) ??
//                  _dateTimeValue;
//              addWeightTrack.date = _dateTimeValue;
//            },
//          )
//        ],
//      ),
//     );
//    }
//   void fetchChartData() {
//     DatabaseReference _dbRef = FirebaseDatabase.instance.ref();
//     addWeightTrack = new WeightTrackEntry(_dateTimeValue, 0);
//     List<charts.Series<WeightTrackEntry, DateTime>> resultChartData;
//     List<WeightTrackEntry> resultData = [
//       new WeightTrackEntry(new DateTime(2022, 03, 11), 50),
//       new WeightTrackEntry(new DateTime(2022, 03, 12), 100),
//       new WeightTrackEntry(new DateTime(2022, 03, 13), 120),
//       new WeightTrackEntry(new DateTime(2022, 03, 14), 150),
//     ];
//     _dbRef.once().then((DatabaseEvent databaseEvent){
//       final databaseValue = jsonEncode(databaseEvent.snapshot.value);
//       Map<String, num> weightByDateMap = new Map();
//       if (databaseValue != null) {
//         Map<String, dynamic> jsonData = jsonDecode(databaseValue) ?? '';
//         var dateFormat = DateFormat("yyyy-MM-dd");
//         for (var weightEntry in jsonData["weightTrack"].values) {
//           var trackedDateStr =
//           DateTime.parse(weightEntry["createdOn"].toString());
//           DateTime dateNow = DateTime.now();
//           var trackedDate = dateFormat.format(trackedDateStr);
//           if (weightByDateMap.containsKey(trackedDate)) {
//             weightByDateMap[trackedDate] =
//                 weightByDateMap[trackedDate]! + weightEntry["kgs"];
//           } else {
//             weightByDateMap[trackedDate] = weightEntry["kgs"];
//           }
//         }
//         List<WeightTrackEntry> weightByDateTimeMap = [];
//         for (var weightEntry in weightByDateMap.keys) {
//           DateTime entryDateTime = DateTime.parse(weightEntry);
//           weightByDateTimeMap.add(new WeightTrackEntry(entryDateTime,
//               int.parse(weightByDateMap[weightEntry].toString())));
//         }
//         weightByDateTimeMap.sort((a, b) {
//           int aDate = a.date.microsecondsSinceEpoch;
//           int bDate = b.date.microsecondsSinceEpoch;
//
//           return aDate.compareTo(bDate);
//         });
//         resultData = weightByDateTimeMap;
//         return weightByDateTimeMap;
//       } else {
//         print("databaseSnapshot key is NULL");
//         return null;
//       }
//     }).then((weightByDateTimeMap) {
//       if (weightByDateTimeMap != null) {
//         resultChartData = [
//           new charts.Series<WeightTrackEntry, DateTime>(
//               id: "Sales",
//               colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//               domainFn: (WeightTrackEntry sales, _) => sales.date,
//               measureFn: (WeightTrackEntry sales, _) => sales.currentWeight,
//               data: weightByDateTimeMap)
//         ];
//       } else {
//         resultData = _createDateTimeSeriesData();
//         resultChartData = [
//           new charts.Series<WeightTrackEntry, DateTime>(
//               id: "Sales",
//               colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//               domainFn: (WeightTrackEntry sales, _) => sales.date,
//               measureFn: (WeightTrackEntry sales, _) => sales.currentWeight,
//               data: resultData)
//         ];
//       }
//       setState(() {
//         _data =resultData;
//         _chartData =resultChartData;
//       });
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//
//     fetchChartData();
//   }
//   static List<WeightTrackEntry> _createDateTimeSeriesData() {
//     List<WeightTrackEntry> resultData = [
//       new WeightTrackEntry(new DateTime(2022, 03, 11), 50),
//       new WeightTrackEntry(new DateTime(2022, 03, 12), 100),
//       new WeightTrackEntry(new DateTime(2022, 03, 13), 120),
//       new WeightTrackEntry(new DateTime(2022, 03, 14), 150),
//     ];
//
//     return resultData;
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     if (_chartData != null) {
//       return Scaffold(
//           appBar: AppBar(
//               elevation: 0,
//               bottom: PreferredSize(
//                 preferredSize: const Size.fromHeight(5.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     new Text("Add Food Entry"),
//                     _addWeightButton(),
//                   ],
//                 ),
//               )),
//           body: new Container(
//             child: charts.TimeSeriesChart(_chartData!, animate: true),
//           ));
//     } else {
//       return CircularProgressIndicator();
//     }
//   }
// }

