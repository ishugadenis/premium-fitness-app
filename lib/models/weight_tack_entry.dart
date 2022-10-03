
import 'package:cloud_firestore/cloud_firestore.dart';

class WeightTrackEntry{
  Timestamp date;
  int currentWeight;
  String userId;

  WeightTrackEntry({required this.date, required this.currentWeight,required this.userId });

  Map<String, dynamic> toJson() => {
    'date': date,
    'id': currentWeight,
    'userId':  userId,
  };

  WeightTrackEntry.fromJson(Map<dynamic, dynamic> json)

      : date = json['date'] ?? Timestamp.now().toDate(),
        currentWeight = json['currentWeight'] ?? 0.0,
        userId = json['userId'] ?? '';
}