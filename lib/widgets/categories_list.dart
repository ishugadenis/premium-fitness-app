import 'package:premium_fitness_app/models/bodyParts.dart';
import '../blocs/database_service.dart';
import 'category_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/wkt_categories.dart';

class CategoriesList extends StatefulWidget {


  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  late DbService _dbService;
  @override
  void initState() {
    _dbService =DbService();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // final categoriesData = Provider.of<Categories>(context);
   // final categories =categoriesData.levels;
    return StreamBuilder<List<BodyParts>>(
      stream:_dbService.bodyParts(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        final cat =snapshot.data!;
        return ListView.builder(
            itemCount: cat.length,
            itemBuilder: (ctx,i)=>ChangeNotifierProvider.value(
              value:cat[i],
              child:CategoryHolder(
                  cat[i].id,
                  cat[i].bodyPart,
                  cat[i].imageUrl,

              ) ,
            ),
        );
      }
    );
  }
}