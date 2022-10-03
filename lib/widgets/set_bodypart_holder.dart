import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/workout_categories.dart';

class SetBodyPartHoder extends StatelessWidget {
  const SetBodyPartHoder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final bp =Provider.of<Category>(context);
    return Container(
      height: 70,
      child: Image.network(bp.imageUrl,
      fit: BoxFit.cover),
      width: 100,


    );
  }
}
