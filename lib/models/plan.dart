import 'package:flutter/material.dart';

class Plan with ChangeNotifier{
  final String bodyPartImage;
  final String exerciseImage;
  final String exerciseName;
  final String exerciseId;
  final String day;
  final String reps;
  final String sets;
  final String userId;

  Plan({
    required this.bodyPartImage,
    required this.exerciseImage,
    required this.exerciseName,
    required this.exerciseId,
    required this.day,
    required this.reps,
    required this.sets,
    required this.userId,

  });

  Map<String, dynamic> toJson() => {
    'bodyPartImage': bodyPartImage,
    'exerciseImage':exerciseImage,
    'exerciseId':exerciseId,
    'exerciseName': exerciseName,
    'day': day,
    'reps':reps,
    'sets':sets,
    'userid':userId,
  };

  Plan.fromJson(Map<String, dynamic> json)

      : bodyPartImage=json['bodyPartImage'] ?? '',
        exerciseImage=json['exerciseImage'] ?? '',
        exerciseId=json['exerciseId'] ?? '',
        exerciseName = json['exerciseName'] ?? '',
        day = json['day'] ?? '',
        reps =json['reps'] ?? '',
        sets =json['sets'] ?? '',
        userId =json['userId']?? '';

}