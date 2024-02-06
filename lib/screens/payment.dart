//import 'package:brig_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'widgets/headerPayment.dart';
//import 'package:brig_project/screens/confirm.dart';
import 'widgets/PaymentBar.dart';


enum Meal { flex, swipe }

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => PaymentState();
}

class PaymentState extends State<PaymentPage> {
  Meal? char = Meal.flex;

  @override
  Widget build(BuildContext context) {
     double total = 0;
    double calculateTotalMealSwipes = 0;
    
    return MaterialApp(
        home:Scaffold(
         appBar: SettingsAppBar3(AppBar(), 'Payment Page'),
        body: Column (
          
        children : [
            Positioned(
              top:10,
              left: 10,
              child: Image.asset(
                "images/tornadoTransparent.png", 
                width: 200, 
                height: 200, 
              ),
            ),
          Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total in Dollars & Flex: \$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total Meal Swipes: \$${calculateTotalMealSwipes.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20),
          ),
        ),  
         const Padding(
          padding: EdgeInsets.all(20.0),),
           const Text( 
           'After submission, your order cannot be modified',
             style: TextStyle(
              fontSize: 20,
               decorationColor:(Color(0xff2D2D2D)),  
            ),
            ),
        const Padding(
          padding: EdgeInsets.all(40.0),),
        ListTile(
          title: const Text('Use Flex Points For Purchase'),
          leading: Radio<Meal>(
            value: Meal.flex,
            groupValue: char,
            onChanged: (Meal? value) {
              setState(() {
                char = value;
              });
            },
          ),
        ),
        
        ListTile(
          title: const Text('Use Meal Swipe for Purchase'),
          
          leading: Radio<Meal>(
            value: Meal.swipe,
            groupValue: char,
            onChanged: (Meal? value) {
              setState(() {
                char = value;
              });
            },
          ),
          
        ), 
        ]
        ),
         bottomNavigationBar: PaymentBar(AppBar(), WhichPage.home),
    )
        
    );
    
  }
  
}

