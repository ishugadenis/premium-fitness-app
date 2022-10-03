import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../blocs/database_service.dart';
import '../widgets/categories_list.dart';

class WorkoutCategories extends StatelessWidget {
  //const WorkoutCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text('Categories'),
      //   backgroundColor: Colors.black,
      //   actions: [
      //     DropdownButton(
      //       icon: Icon(
      //         Icons.more_vert,
      //         color: Theme.of(context).primaryColor,
      //       ),
      //       items: [
      //         DropdownMenuItem(
      //           child: Container(
      //             child: Row(
      //               children: const <Widget>[
      //                 Icon(Icons.exit_to_app),
      //                 SizedBox(width: 8),
      //                 Text('Logout'),
      //               ],
      //             ),
      //           ),
      //           value: 'logout',
      //         ),
      //       ],
      //       onChanged: (itemIdentifier) {
      //         if (itemIdentifier == 'logout') {
      //           FirebaseAuth.instance.authStateChanges();
      //         }
      //       },
      //     ),
      //   ],
      // ),

      body:
          //   ListView(
          // children: Categories_List.map((catData) =>CategoryHolder(catData.title, catData.imageUrl, catData.about)).toList(),
          //
          // ),
          Container(
              decoration: BoxDecoration(color: Colors.blueGrey[50]),
              child: CategoriesList(),
          ),
    );
  }
}
