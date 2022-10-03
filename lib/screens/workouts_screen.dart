import 'package:flutter/material.dart';
import 'package:premium_fitness_app/blocs/database_service.dart';
import 'package:premium_fitness_app/models/exerciseDb.dart';
import 'package:premium_fitness_app/providers/exercise.dart';
import 'package:premium_fitness_app/providers/wkt_categories.dart';
import 'package:premium_fitness_app/widgets/exercise_holder.dart';
import '../models/bodyParts.dart';
import '../providers/wkt_categories.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatefulWidget {
  //const WorkoutScreen({Key? key}) : super(key: key);

  static const routeName = './workouts-screen';

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  late DbService _dbService;
  @override
  void initState() {
    _dbService = DbService();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as dynamic;
    final categoryTitle= routeArgs['title']??'';
    final categoryId = routeArgs['id'] ?? '';
    final imageUrl =routeArgs['imageUrl'] ?? '';

    _dbService.selectedPart =categoryId;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(categoryTitle),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.55,
            child: StreamBuilder<List<ExerciseDb>>(
              stream: _dbService.filtered(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                final exsnap = snapshot.data!;
                return ListView.builder(
                  itemCount: exsnap.length,
                  itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                    value: exsnap[i],
                    key: const ValueKey('exlist'),
                    child: ExerciseHolder(),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
