import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../models/bodyParts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/exerciseDb.dart';
import '../models/goalsDb.dart';
import '../models/plan.dart';
import '../models/weight_tack_entry.dart';

class DbService with ChangeNotifier{

 var selectedExercise;
  var selectedPart;
  var setDefaultPart =true;
  var setDefaultExercise =false;
  var dayName;
 var uid =FirebaseAuth.instance.currentUser!.uid;


  Stream<List<BodyParts>> bodyParts() => FirebaseFirestore.instance
      .collection('bparts').orderBy('id')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((e) => BodyParts.fromJson(e.data())).toList());



  Stream<List<ExerciseDb>> exerciseDb() => FirebaseFirestore.instance
      .collection('execiseDb')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((e) => ExerciseDb.fromJson(e.data())).toList());


  Stream<List<ExerciseDb>> filtered() => FirebaseFirestore.instance
      .collection('execiseDb').where('category', isEqualTo: selectedPart ).orderBy('id')
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((e) => ExerciseDb.fromJson(e.data())).toList());

  Stream<List<Plan>> plans() => FirebaseFirestore.instance
      .collection('Schedule').where('day', isEqualTo: dayName ).where('userId',
        isEqualTo: uid)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.map((e) => Plan.fromJson(e.data())).toList());

 Stream<List<GoalsDb>> goals() => FirebaseFirestore.instance
     .collection('goalsDb').where('userId', isEqualTo: uid)
     .snapshots()
     .map((snapshot) =>
     snapshot.docs.map((e) => GoalsDb.fromJson(e.data())).toList());

 Stream<List<WeightTrackEntry>> progress() => FirebaseFirestore.instance
     .collection('progress').orderBy('date').where('userId', isEqualTo: uid)
     .snapshots()
     .map((snapshot) =>
     snapshot.docs.map((e) => WeightTrackEntry.fromJson(e.data())).toList());




}