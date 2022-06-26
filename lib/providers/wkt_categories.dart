
import 'package:flutter/material.dart';
import 'workout_categories.dart';


class Categories with ChangeNotifier{
 final List<Category>_levels = [
   Category(
     id:'c1',
     title: 'Chest',
     imageUrl: 'https://img.freepik.com/free-photo/muscular-torso-sexy-young-fitness-male-bodybuilder-model-power-athletic-man-antique-statue-with-perfect-muscles-six-pack-abs-bare-nude-chest-posing-dark-background_175356-2890.jpg?w=2000',
 ),
   Category(
       id:'c2',
       title: 'BICEPS',
       imageUrl: 'https://wallpaperaccess.com/full/1904931.jpg',
   ),
   Category(
       id:'c3',
       title: 'TRICEPS',
       imageUrl: 'https://media.istockphoto.com/photos/handsome-power-athletic-man-turned-back-picture-id487768400?k=20&m=487768400&s=612x612&w=0&h=UneMTNpRihsUfesxmzbrA5IxVE0wwEqv54xIapUMkKg=',
   ),
   Category(
       id:'c4',
       title: 'SHOULDER',
       imageUrl: 'https://thumbs.dreamstime.com/b/fitness-man-background-shoulder-biceps-pectoral-muscles-triceps-bodybuilder-dark-demonstrates-physical-form-classes-173769294.jpg',
   ),

   Category(
       id:'c5',
       title: 'ABS',
       imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQV5wDrHe1w4Wl5UzhU8hZ2vDCFGXtRz9soYQ&usqp=CAU',
   ),
   Category(
       id:'c6',
       title: 'BACK',
       imageUrl: 'https://media.istockphoto.com/photos/muscular-man-showing-back-muscles-isolated-on-black-background-strong-picture-id1295665576?b=1&k=20&m=1295665576&s=170667a&w=0&h=5Va6aYonjx-BX3oeGZy0xtnKUywUT5pRqvaUvrTl0jA=',
   ),
   Category(
       id:'c7',
       title: 'FOREARM',
       imageUrl: 'https://thumbs.dreamstime.com/b/tense-arm-clenched-fist-veins-bodybuilder-muscles-dark-background-isolate-tense-arm-clenched-fist-veins-bodybuilder-173769329.jpg',
   ),
   Category(
       id:'c8',
       title: 'LEG',
       imageUrl: 'https://media.istockphoto.com/photos/detail-of-male-bodybuilder-front-leg-muscles-on-black-background-and-picture-id1004109074?k=20&m=1004109074&s=612x612&w=0&h=zOQz3zOd2SHae_s75gQJ8xlE7_ITEo38pN50GrEreFo=',
   ),
   Category(
       id:'c9',
       title: 'CALF',
       imageUrl: 'https://criticalbody.com/wp-content/uploads/2022/01/21-inch-calves-bodybuilder-jan22-1024x576.jpg',
   ),
   Category(
       id:'c10',
       title: 'CARDIO',
       imageUrl: 'https://wallpapercave.com/wp/wp7535570.jpg',

   ),
 ];

 List<Category> get levels{
   return[..._levels];
 }


 //   void findById() {
 //    _list.where((element) => element.id == _levels.)
 //
 // }
 void addCategory(){
   //_levels.add(value);
   notifyListeners();
 }

 bool _disposed =false ;


 @override
 void dispose() {
   _disposed = true;
   super.dispose();
 }

 @override
 void notifyListeners() {
   if (!_disposed) {
     super.notifyListeners();
   }
 }
}