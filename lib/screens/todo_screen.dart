import 'package:flutter/material.dart';



class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

    static const routeName = './todo-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title:const Text('Todo')
       ),
      body: const Center(  
        child: Text('To do')
      ),
    );
  }
}