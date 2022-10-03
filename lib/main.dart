import 'package:flutter/material.dart';
import 'package:premium_fitness_app/providers/workout_categories.dart';
import './screens/set_workout_screen.dart';
import './screens/day_plan_screen.dart';
import 'package:premium_fitness_app/screens/specific_exercise%20_screen.dart';
import 'package:premium_fitness_app/screens/workouts_screen.dart';
import './screens/authentication_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './providers/wkt_categories.dart';
import 'package:provider/provider.dart';
import './providers/exercise.dart';
import './screens/tabs_screen.dart';
import './providers/plans.dart';
import 'providers/goals.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';


void main()  async {
  MpesaFlutterPlugin.setConsumerKey('jXNtD6Zy8iBevsrZUqLpGbNKboFRHabe');
  MpesaFlutterPlugin.setConsumerSecret('Ou7Xc6coKe0L8mGY');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}  ) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
            value:Categories()),
        ChangeNotifierProvider.value(
          value:Exercises(),),
        ChangeNotifierProvider.value(
          value:Plans() ,),
        ChangeNotifierProvider.value(
          value: Goals()
        ),

      ],

      child: MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Premium Fitness App',
          theme: ThemeData(
            fontFamily: 'Roboto',
            primarySwatch: Colors.pink,
            backgroundColor:Colors.black,
            accentColor: Colors.purple,
            accentColorBrightness: Brightness.dark,
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.black,
              textTheme: ButtonTextTheme.primary,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              )


            ),
          ),

          home:StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder:(ctx, userSnapshot){
            if(userSnapshot.hasData) {
              return TabsScreen();
            }
            return AuthenticationScreen();
          }),
          routes: {
            WorkoutScreen.routeName : (_) => WorkoutScreen(),
            SpecificExercise.routeName: (_) => SpecificExercise(),
            DayPlan.routeName: (_) => DayPlan(),
            SetWorkout.routeName:(_)=> SetWorkout(),

          }
        ),
    );


  }
}
