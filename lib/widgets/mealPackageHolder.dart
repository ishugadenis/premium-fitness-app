import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealPackageHolder extends StatelessWidget {
  const MealPackageHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight:Radius.circular(20) ,topLeft:Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ClipRRect(
                  borderRadius:  BorderRadius.only(topRight:Radius.circular(20) ,topLeft:Radius.circular(20)),
                  child: Image.network('https://images.pexels.com/photos/8180728/pexels-photo-8180728.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 50,
                  //margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Text("Premium Plan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFFE3D2C4),
              borderRadius: BorderRadius.only(bottomRight:Radius.circular(20) ,bottomLeft:Radius.circular(20))
            ),
            width: MediaQuery.of(context).size.width * 0.4,
            child:Text("Purchase",
            style: TextStyle(
               color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            textAlign: TextAlign.center,)
          )
        ],
      ),

    );
  }
}
