import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/uplan_holder.dart';
import '../providers/exercise.dart';

class UplanList extends StatelessWidget {
  const UplanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final it = Provider.of<Exercises>(context).list;

    return ListView.builder(itemBuilder: 
    (context, index) => ChangeNotifierProvider.value(
      value: it[index],
      child: UplanHolder()),
      itemCount: it.length,
      );
  }
}
