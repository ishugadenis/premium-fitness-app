import 'package:flutter/widgets.dart';

class Goal  {
  String goal;
  double goalNo;
  DateTime date;
  bool isComplete;

  Goal({
    required this.goal,
    required this.goalNo,
    required this.date,
    required this.isComplete

  });
}

// class Goals with ChangeNotifier {
//
//   final List<Goal> _list = [
//     Goal(
//       goal: 'Gain weight',
//       goalNo: 55,
//       date: DateTime.now(),
//       isComplete: false,
//     )
//
//   ];
//
//   List<Goal> get list{
//     return[..._list];
//   }
//
//
//   List<Goal> get recentGoals {
//     return [..._list].where((g) {
//       return g.date.isAfter(DateTime.now().subtract(Duration(days: 30),),
//       );
//     }).toList();
//   }
//
//   // void addNewGoal(String uGoal, double uGoalNumber, DateTime uDate) {
//   //    Goal(
//   //     goal: uGoal,
//   //     goalNo: uGoalNumber,
//   //     date: DateTime.now(),
//   //     isComplete: false,
//   //   );
//   //
//   //
//   //   notifyListeners();
//   // }
// }
