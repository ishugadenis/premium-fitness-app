import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class Goal with ChangeNotifier {
  final String goalId;
  late final String goalName;
  final DateTime dateSet;
  final String currentWeight;
  final String targetWeight;

  Goal({
    required this.goalId,
    required this.goalName,
    required this.dateSet,
    required this.currentWeight,
    required this.targetWeight,
  });
}

class Goals with ChangeNotifier {
   List<Goal> _g = [
    // Goal(
    //     goalId: '01',
    //     goalName: 'Gain weight',
    //     dateSet: DateTime.now(),
    //     currentWeight: '55',
    //     targetWeight: '65',
    //     ),
    // Goal(
    //     goalId: '02',
    //     goalName: 'Gain weight',
    //     dateSet: DateTime.now(),
    //     currentWeight: '55',
    //     targetWeight: '65',
    //     ),
  ];
  List<Goal> get g {
    return [..._g];
  }
Goal getlastGoal(){
    return _g.last;
}

  Future<void> fetchAndSetGoals() async{
    final CollectionReference goalsDb = FirebaseFirestore.instance.collection('goalsDb');
    final res = await goalsDb.snapshots();
    final data = res as Map<String, dynamic>;
    final List<Goal> goalData =[];
    data.forEach((goalId, goal) {
     _g.add(Goal(
       goalId: goalId,
       goalName: goal['goalName'],
       dateSet: goal['dateSet'],
       currentWeight: goal['currentWeight'],
       targetWeight:goal['targetWeight'],
     )) ;
    });
    _g = goalData;



  }

  Future<void> updateGoal(String goalId, Goal newGoal) async{
    final goalIndex = _g.indexWhere((goal) => goal.goalId == goalId);
    if (goalIndex >= 0) {
      final CollectionReference goalsDb = FirebaseFirestore.instance.collection('goalsDb');
       await goalsDb.doc(goalId).update({
        'goalName':newGoal.goalName,
        'dateSet':newGoal.dateSet,
        'currentWeight': newGoal.currentWeight,
        'targetWeight': newGoal.targetWeight,
      });
      _g[goalIndex] = newGoal;
      notifyListeners();
    } else {
      print('...');
    }
  }

  Future<void> addProduct(Goal goal) async{
    final CollectionReference goalsDb = FirebaseFirestore.instance.collection('goalsDb');
    await goalsDb.add({
      'goalName':goal.goalName,
      'dateSet' :goal.dateSet,
      'currentWeight': goal.currentWeight,
      'targetWeight':goal.targetWeight,
    });
    print(goalsDb);
    final newGoal = Goal(
      currentWeight: goal.currentWeight,
      dateSet: goal.dateSet,
      goalId: DateTime.now().toString(),
      goalName: goal.goalName,
      targetWeight: goal.targetWeight,
    );
    _g.add(newGoal);
    notifyListeners();
  }
}
