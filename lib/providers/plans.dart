import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class Plan with ChangeNotifier {
  final String id;
  final String title;
  final String imageUrl;
  final String duration;

  Plan(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.duration});
}

class Plans with ChangeNotifier {
  final List<Plan> _items = [
    Plan(
        id: 'p1',
        title: 'Beginner',
        imageUrl:
            'https://thumbs.dreamstime.com/b/closeup-strength-fitness-body-dumbbell-fit-young-man-beautiful-torso-beginner-bodybuilder-muscular-body-concept-145674473.jpg',
        duration: '30 Days'),
    Plan(
        id: 'p1',
        title: 'Beginner',
        imageUrl:
            'https://thumbs.dreamstime.com/b/closeup-strength-fitness-body-dumbbell-fit-young-man-beautiful-torso-beginner-bodybuilder-muscular-body-concept-145674473.jpg',
        duration: '30 Days'),
    Plan(
        id: 'p1',
        title: 'Beginner',
        imageUrl:
            'https://thumbs.dreamstime.com/b/closeup-strength-fitness-body-dumbbell-fit-young-man-beautiful-torso-beginner-bodybuilder-muscular-body-concept-145674473.jpg',
        duration: '30 Days'),
    Plan(
        id: 'p1',
        title: 'Beginner',
        imageUrl:
            'https://thumbs.dreamstime.com/b/closeup-strength-fitness-body-dumbbell-fit-young-man-beautiful-torso-beginner-bodybuilder-muscular-body-concept-145674473.jpg',
        duration: '30 Days'),
    Plan(
        id: 'p1',
        title: 'Beginner',
        imageUrl:
            'https://thumbs.dreamstime.com/b/closeup-strength-fitness-body-dumbbell-fit-young-man-beautiful-torso-beginner-bodybuilder-muscular-body-concept-145674473.jpg',
        duration: '30 Days')
  ];

  List<Plan> get items {
    return [..._items];
  }
}
