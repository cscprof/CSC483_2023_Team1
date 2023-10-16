import 'package:brig_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'widgets/headerBar.dart';




class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      title:"Login Page",
       home:Scaffold(
        appBar: TopAppBar(AppBar(), "Login Page", Colors.yellow, Colors.black),
         body: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In With Geneva Student ID:',
                style: TextStyle(fontSize: 30),
              ),
            
            
             const SizedBox(
              
              width: 250,
             child: TextField(
             obscureText: true,
             decoration: InputDecoration(
             border: OutlineInputBorder(),
             labelText: 'User ID:',
                  ),
                 ),
                 
               ),
                const SizedBox(
              width: 250,
             child: TextField(
             obscureText: true,
             decoration: InputDecoration(
             border: OutlineInputBorder(),
             labelText: 'PIN:',
                  ),
                 ),
               ),
               
              ElevatedButton(
               style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellow),
                ),
                child: const Text('Sign In'),
               onPressed: ()
                {
               Navigator.push(
                   context, 
                 MaterialPageRoute(builder: (context) => HomePage())
               );
                },
              ),      
              ElevatedButton(
               style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.yellow),
                ),
                child: const Text('Lost ID Card?'),
                
               onPressed: ()
                {
                   Navigator.push(
                   context, 
                 MaterialPageRoute(builder: (context) => HomePage())
               );
                },
              ),
              //test
              
            ],  

          ),
        ),
      )
    );

  }

  // look at current time, output value

  DateTime currentTime() {
    return DateTime.now();
  }

}

      


    
  



