//import 'package:brig_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'widgets/headerpayment.dart';
//import 'package:brig_project/screens/confirm.dart';
import 'widgets/paymentbar.dart';


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
        body: Stack(
          
        children : [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/backgroundColor.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width / 3,
              child: Image.asset(
                "assets/images/tornadoTransparent.png",
                width: 400,
                height: 700,
              ),
            ),
               Positioned(
              top: 200,
              left: MediaQuery.of(context).size.width / 5,
              child: Image.asset(
                "assets/images/wordBrig.png",
                width: 700,
                height: 500,
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
         const Padding(
          padding: EdgeInsets.all(20.0),),
           const Text( 
           'After submission, your order cannot be modified',
            
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
          
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
    )
        ])
         , bottomNavigationBar: PaymentBar(AppBar(), WhichPage.home),)  
    );
    
  }
  
}

