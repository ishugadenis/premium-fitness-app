

import 'package:flutter/material.dart';

class ExerciseDb with ChangeNotifier{
  final String category;
  final String description;
  final String equipments;
  final String id;
  final String imageUrl;
  final String title;

  ExerciseDb({
      required this.category,
    required this.description,
    required this.equipments,
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  Map<String, dynamic> toJson() => {
     'category': category,
     'description': description,
     'equipments':equipments,
    'id': id,
    'imageUrl': imageUrl,
    'title':title
  };

  ExerciseDb.fromJson(Map<String, dynamic> json)

      : category=json['category'] ?? '',
        description=json['description']?? '',
        equipments=json['equipments'] ?? '',
        id = json['id'] ?? '',
        imageUrl = json['imageUrl'] ?? '',
        title =json['title'] ?? '';



}