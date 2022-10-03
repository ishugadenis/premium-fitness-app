import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/initializer.dart';
import 'package:mpesa_flutter_plugin/payment_enums.dart';
import 'package:premium_fitness_app/widgets/mealPackageHolder.dart';

class MealScreen extends StatefulWidget {
  const MealScreen({Key? key}) : super(key: key);

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  Future<void> startCheckout({required String userPhone,  required double amount })async {
    dynamic transactionInitialisation;
    try {
      //Run it
      transactionInitialisation =
      await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode: "174379",
          transactionType: TransactionType.CustomerPayBillOnline,
          amount: amount,
          partyA: userPhone,
          partyB: "174379",
          callBackURL: Uri(scheme: "https", host : "1234.1234.co.ke", path: "/1234.php"),
          accountReference: "Premium Fitness Gym",
          phoneNumber: userPhone,
          baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
          transactionDesc: "purchase",
          passKey: "bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919");

      print("TRANSACTION RESULT: " + transactionInitialisation.toString());

      //You can check sample parsing here -> https://github.com/keronei/Mobile-Demos/blob/mpesa-flutter-client-app/lib/main.dart

      /*Update your db with the init data received from initialization response,
      * Remaining bit will be sent via callback url*/
      return transactionInitialisation;
    } catch (e) {
      //For now, console might be useful
      print("CAUGHT EXCEPTION: " + e.toString());

      /*
      Other 'throws':
      1. Amount being less than 1.0
      2. Consumer Secret/Key not set
      3. Phone number is less than 9 characters
      4. Phone number not in international format(should start with 254 for KE)
       */
    }

  }
  var phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 0,vertical: 15),
                child: Text('Gain Weight',
                style: TextStyle(
                  color: Color(0xFFE3D2C4),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),)),
            Row(
              children: [
                GestureDetector(
                  onTap: (){
                    startCheckout(userPhone: "254799768112",
                        amount: 100);
                  },
                  child: MealPackageHolder()
                )
              ],
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 0,vertical: 15),
                child: Text('Loose Weight',
                  style: TextStyle(
                    color: Color(0xFFE3D2C4),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),)),
            Row(
              children: [
                GestureDetector(
                    onTap: (){
                      openDialog();
                    //   startCheckout(userPhone: "254799768112",
                    //       amount: 100);
                     },
                    child: MealPackageHolder()
                )
              ],
            ),
          ],
        ),
      ),
    );

  }
  Future openDialog() => showDialog(context: context,
      builder: (context)=>AlertDialog(
        title: Text('Lipa na mpesa'),
        content: TextField(
          onChanged: (value){
            setState(() {
              phoneNumber = value;
            });
          },
          decoration: InputDecoration(
              hintText: 'Enter you number +254'
          ),
        ),
        actions: [
          TextButton(onPressed: (){},
              child: Text("cancel")),
          TextButton(onPressed: (){
            startCheckout(userPhone: phoneNumber,
                amount: 1);
          },
              child: Text('Ok'))
        ],
      )
  );
}
