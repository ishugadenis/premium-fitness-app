import 'package:flutter/material.dart';
import '../pickers/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfileScreen extends StatelessWidget{
 // const MyProfileScreen({Key? key}) : super(key: key);

  var userId = " ";
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             UserImagePicker(),
              //SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FutureBuilder<DocumentSnapshot>(
                  future:FirebaseFirestore.instance.collection('users').doc(userId).get(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting){
                       return Text('User');

                    }
                    return Text(
                      snapshot.data!['username'] ,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    );
                  }
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Email',
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Email',
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.normal),
                      ),
                    ],
                  )),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Settings',
                        style:
                            TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.settings,
                        size: 30,
                      )
                    ],
                  )),
              Divider(
                thickness: 0.5,
                color: Colors.grey,
              ),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Log out',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Theme.of(context).primaryColor,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
