import 'package:brig_project/screens/home.dart';
import 'package:flutter/material.dart';
//import 'package:brig_project/screens/confirm.dart';
import 'widgets/headerconfirm.dart';
import 'widgets/bottombar.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     home: Scaffold(
        appBar: SettingsAppBar3(AppBar(), 'Receipt'),
        body: Stack(              
                  children: [
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
              const SizedBox(height:45),
             Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
          '   Order No.' "232" " was accepted and cannot be modified"  ' Your estimated wait time is: ${calculateEstimatedTime()} minutes',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
              ),
            ),
              const SizedBox(height:300),
                const Text( 
           "Order Details:" " Burger SWIPE, Side of Fries SWIPE, Fountain Drink SWIPE",
             style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
               decorationColor:(Color(0xff2D2D2D)),  
            ),
            ),
              const Padding(
          padding: EdgeInsets.all(50.0),),
              ElevatedButton(
               style: const ButtonStyle(
               backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700)),
                ),
                child: const Text('Return to Home'),
                
               onPressed: ()
                {
                 Navigator.push(
                    context, 
                   MaterialPageRoute(builder: (context) => const HomePage())
                           );
                },
              ),
                   ],
                      
            ),
          
          ),
                  ] ) 
                    , bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
                    )
                  
        ); 
   }
   
     calculateEstimatedTime() {}
}
