import 'package:brig_project/firebase/users.dart';
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
        appBar: SettingsAppBar3(AppBar(), 'Confirmation Receipt'),
        body: Stack(              
                  children: [
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
           const Text( 
           'Order No.' "232" " was accepted and cannot be modified",
             style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
               decorationColor:(Color(0xff2D2D2D)),  
            ),
            ),
             Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Your estimated wait time is: ${calculateEstimatedTime()} minutes',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
              ),
            ),
                const Text( 
           "Order Details:" " Burger SWIPE, Side of Fries SWIPE, Fountain Drink SWIPE",
             style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
               decorationColor:(Color(0xff2D2D2D)),  
            ),
            ),
              const Padding(
          padding: EdgeInsets.all(200.0),),
              ElevatedButton(
               style: const ButtonStyle(
               backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700)),
                ),
                child: const Text('Return to Home'),
                
               onPressed: ()
                {
                  currentUser.clearCart(); // need to put here to allow tiem for database to upload information
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
