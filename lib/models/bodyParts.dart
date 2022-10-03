
import 'package:flutter/material.dart';

class BodyParts with ChangeNotifier{
  final String bodyPart;
  final String id;
  final String imageUrl;

  BodyParts( {required this.bodyPart,
               required this.id,
               required this.imageUrl});

  Map<String, dynamic> toJson() => {
    'bodyPart': bodyPart,
    'id': id,
    'imageUrl': imageUrl,
  };

  BodyParts.fromJson(Map<String, dynamic> json)

      : bodyPart =json['bodyPart'] ?? '',
        id = json['id'] ?? '',
        imageUrl = json['imageUrl'] ?? '';



}