import 'package:flutter/material.dart';
import 'package:premium_fitness_app/widgets/progress_holder.dart';
import 'package:provider/provider.dart';
import 'update_form.dart';
import '../providers/goals.dart';

class ProgressList extends StatefulWidget {
  const ProgressList({Key? key}) : super(key: key);

  @override
  State<ProgressList> createState() => _ProgressListState();
}

class _ProgressListState extends State<ProgressList> {

  var _isInit =true;
   @override
  void didChangeDependencies() {
     if(_isInit) {
       Provider.of<Goals>(context).fetchAndSetGoals();
     }
     _isInit =false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {

   final holder = Provider.of<Goals>(context).g;
    return Container(
      height: 200,
      child: ListView.builder(
        reverse: true,
        itemCount: holder.length,
        itemBuilder:(ctx, i)=>
        ChangeNotifierProvider.value(
          value: holder[i] ,
            child:ProgressHolder(goal: holder[i],)),
        ),
    );
  }
}
