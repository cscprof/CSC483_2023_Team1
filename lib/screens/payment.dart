//import 'package:brig_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'widgets/headerpayment.dart';
//import 'package:brig_project/screens/confirm.dart';
import 'widgets/paymentbar.dart';
import '../firebase/users.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => PaymentState();
}

class PaymentState extends State<PaymentPage> {

  @override
  Widget build(BuildContext context) {
    double total = currentUser.priceWithoutFlex();  
    int calculateTotalMealSwipes = currentUser.totalSwipes;
    
    return MaterialApp(
        home:Scaffold(
         appBar: SettingsAppBar3(AppBar(), 'Payment Page'),
        body: Stack(
          
        children : [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/backgroundColor.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width / 13,
              child: Image.asset(
                "assets/images/tornadoTransparent.png",
                width: 400,
                height: 700,
              ),
            ),
               Positioned(
              top: 200,
              left: MediaQuery.of(context).size.width / 4.5,
              child: Image.asset(
                "assets/images/wordBrig.png",
                width: 500,
                height: 300,
              ),
            ),
           Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [      
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total in Dollars & Flex: \$${total.toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total Meal Swipes: \$${calculateTotalMealSwipes.toStringAsFixed(2)}',
             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
          ),
        ),  
        const SizedBox(height:200),
         const Padding(
          padding: EdgeInsets.all(20.0),),
           const Text( 
           '   After submission, your order cannot be modified',
            
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
          
            ),
        const Padding(
          padding: EdgeInsets.all(40.0),),
          ListTile(
            title: const Text('Make a Favorite Order'),
            leading: Switch(
              value: currentUser.isFavorite, 
              onChanged: (bool value) {
                setState(() {
                  currentUser.isFavorite = value;
                  debugPrint('isFavorite value : ${currentUser.isFavorite}');
                });
              }
            )
          ), 
        ]
        ),
    )
        ])
         , bottomNavigationBar: PaymentBar(AppBar(), WhichPage.home),)  
    );
    
  }
  
}

