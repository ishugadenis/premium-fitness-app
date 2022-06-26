import 'package:flutter/material.dart';

class DrawerA extends StatelessWidget {
  const DrawerA ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ListTile(
        leading: Icon(Icons.calendar_today_outlined),
        title: Text('Plan'),
      ),
    );
  }
}
