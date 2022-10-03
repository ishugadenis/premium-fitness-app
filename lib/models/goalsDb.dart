import 'package:flutter/material.dart';

class GoalsDb{
  final String targetWeight;
  final String userId;
   bool isTargetSet = false;


  GoalsDb({
    required this.targetWeight,
    required this.userId,
    required this.isTargetSet,
  });

  Map<String, dynamic> toJson() => {
    'TargetWeight': targetWeight,
     'userId': userId,
    'isTargetSet': isTargetSet,
  };

  GoalsDb.fromJson(Map<String, dynamic> json)

      :targetWeight = json['targetWeight'] ?? '',
        userId =json['userId'] ?? '',
        isTargetSet = json['isTargetSet'] ?? '';
}