import 'package:flutter/material.dart';
import 'package:premium_fitness_app/screens/workouts_screen.dart';
import '../providers/workout_categories.dart';
import 'package:provider/provider.dart';

class CategoryHolder extends StatelessWidget {
  //const CategoryHolder({Key? key}) : super(key: key);
//   final String id;
//   final String title;
//   final String imageUrl;
//
//   CategoryHolder(
//       this.id,
//       this.title,
//       this.imageUrl,
//
// );

  @override
  Widget build(BuildContext context) {
    final category = Provider.of<Category>(context);

    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context)
            .pushNamed(WorkoutScreen.routeName, arguments: category.id);
      },
       child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  image: NetworkImage(category.imageUrl),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.black54,
              ),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      category.title,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
