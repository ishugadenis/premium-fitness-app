import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:premium_fitness_app/models/bodyParts.dart';
import 'package:premium_fitness_app/models/exerciseDb.dart';
import 'package:provider/provider.dart';
import '../providers/wkt_categories.dart';
import '../blocs/database_service.dart';


class SetWorkout extends StatefulWidget {

  static const routeName = '/set-workout';
  @override
  _SetWorkoutState createState() => new _SetWorkoutState();
}

class _SetWorkoutState extends State<SetWorkout> {

  late DbService _dbService;
  String? bodyPartImage;
  String? exerciseImage;
  String? exerciseName;
  String? day;
  String? reps;
  String? sets;

  void _submitData() async{
    print(exerciseImage);
    print(exerciseName);
    print (reps);
    print(sets);
    print (day);
    print(uid);

     setState(() {
       _dbService.uid =uid;
     });

    if(exerciseName!.isEmpty || exerciseImage!.isEmpty || reps!.isEmpty || sets!.isEmpty  ) {
      return;
    }
      Navigator.of(context).pop();
      FirebaseFirestore.instance.collection('Schedule').add(
        {
          'bodyPartImage': bodyPartImage,
          'exerciseId': _dbService.selectedExercise,
          'exerciseImage': exerciseImage,
          'exerciseName': exerciseName,
          'day':day,
          'sets': sets,
          'reps': reps,
          'userId' :_dbService.uid,
        }
    );
  }

   @override
  void initState() {
     _dbService =DbService();
    // TODO: implement initState
    super.initState();
  }

   var uid =FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final plannedDay =routeArgs['day'];
     day =plannedDay;
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.black,
      title: Text('Choose workout'),

     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Container(
             child: StreamBuilder<List<BodyParts>>(
               stream: _dbService.bodyParts(),
               builder: (context, snapshot) {
                 if (snapshot.connectionState == ConnectionState.waiting) {
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                  }
                  final snap = snapshot.data;
                 // if(_dbService.setDefaultPart){
                 //   _dbService.selectedPart = snap!.elementAt(0).id ;
                 // }
                 return Container(
                       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                           margin: EdgeInsets.symmetric(horizontal:10, vertical: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Expanded(
                                   child:DropdownButtonHideUnderline(
                                     child: ButtonTheme(
                                       alignedDropdown: true,
                                       child: DropdownButton<dynamic>(
                                         isExpanded: true,
                                         enableFeedback: true,
                                         hint: Text('Select Category'),
                                         value: _dbService.selectedPart,
                                         items: snap!.map<DropdownMenuItem>(( part){
                                           return DropdownMenuItem(
                                               enabled: true,
                                               value: part.id,
                                               child: Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                 children: [

                                                     Image.network(bodyPartImage = part.imageUrl,
                                                     fit: BoxFit.cover,
                                                     //height: 150,
                                                     width: 75),

                                                   Container(
                                                     margin: EdgeInsets.only(left: 10,),
                                                     child:Text(part.bodyPart),

                                                   ),
                                                 ],
                                           ),
                                           );

                                         }).toList(),
                                         onChanged: (newValue){
                                           setState(() {
                                             _dbService.selectedPart = newValue;
                                             _dbService.selectedExercise =null;
                                            // _dbService.setDefaultPart = true;
                                            // _dbService.setDefaultExercise =true;
                                           });
                                         },

                                       ),
                                     ),
                                   ) ),
                             ],

                           ),

                     );
               }
             ),
           ),
            Container(
               child:
               StreamBuilder<List<ExerciseDb>>(
                   stream: _dbService.filtered(),
                   builder: (context, snapshot) {
                     if (snapshot.connectionState == ConnectionState.waiting) {
                       return Center(
                         child: CircularProgressIndicator(),
                       );
                     }
                     final Esnap = snapshot.data;
                     // if(_dbService.setDefaultExercise){
                     //   _dbService.selectedExercise = Esnap!.elementAt(0).id ;
                     //}
                     return Container(
                       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                       margin: EdgeInsets.symmetric(horizontal:10, vertical: 10),
                       child:Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(
                               child:DropdownButtonHideUnderline(
                                 child: ButtonTheme(
                                   alignedDropdown: true,
                                   child: _dbService.selectedPart != null ?
                                   DropdownButton<dynamic>(
                                     itemHeight: 100,
                                     isExpanded: true,
                                     enableFeedback: true,
                                     hint: Text('Select Workout'),
                                     value: _dbService.selectedExercise,
                                     items: Esnap!.map(( part){
                                      // final dynamic data = part.data();
                                       return DropdownMenuItem(
                                         enabled: true,
                                         value: part.id,
                                         onTap:(){
                                           setState(() {
                                             exerciseImage = part.imageUrl;
                                             exerciseName = part.title;
                                           });
                                         } ,
                                          child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [

                                             Image.network( part.imageUrl,
                                                 fit: BoxFit.cover,
                                                 width: 75),
                                              Container(
                                                 margin: EdgeInsets.only(right: 10,left: 10,),
                                                   child: Container(
                                                     height:40,
                                                     width: 150,
                                                     child: Text( part.title,
                                                     style:TextStyle(fontSize:16,),
                                                      overflow:TextOverflow.clip,
                                                      maxLines: 2,
                                                     //
                                                       //textAlign:TextAlign.center
                                                 ),
                                                   ),
                                               ),


                                           ],
                                         ),
                                       );

                                     }).toList(),
                                     onChanged: (Value){
                                       setState(() {
                                         _dbService.selectedExercise = Value;
                                        // _dbService.setDefaultExercise =false;
                                       });
                                     },

                                   ):Text('Choose Body part'),
                                 ),
                               ) ),
                         ],

                       ),

                     );
                   }
               )
                   //: Text('Add ex')
             ),
           Container(
               margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              padding: EdgeInsets.symmetric(vertical:0,horizontal: 15),
              width: double.infinity,
            //height: 60,
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Expanded(
                 child: TextField(
                  onChanged: (value){
                  setState(() {
                  sets = value;
                  });
                  },
                   decoration: InputDecoration(
                    label: Text('Sets'),
                ),
                ),
                ),
                Container(
                padding: EdgeInsets.symmetric(vertical:0,horizontal: 15),
                  child: Text('X',
                    style: TextStyle(
                    fontSize: 23
            ),)),
              Expanded(
               child: TextField(
                onChanged: (value){
                setState(() {
                reps = value;
                });
                },
               decoration: InputDecoration(
                label: Text('Reps'),
            ),
            ),
            ),

            ],
            ),
            ),

         Container(
           child: RaisedButton(
             color: Colors.black,
             child: Text( 'Save'),
             onPressed:
             _submitData
           ),
         )
         ],
       ),
     ),
    );
  }
}


