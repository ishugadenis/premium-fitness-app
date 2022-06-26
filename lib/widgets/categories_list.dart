import 'category_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wkt_categories.dart';

class CategoriesList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   final categoriesData = Provider.of<Categories>(context);
   final categories =categoriesData.levels;
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx,i)=>ChangeNotifierProvider.value(
          value:categories[i],
          child: CategoryHolder(
              // categories[i].id,
              // categories[i].title,
              // categories[i].imageUrl,

              ),
        ),
    );
  }
}