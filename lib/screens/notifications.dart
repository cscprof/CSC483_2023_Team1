import 'package:brig_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'widgets/HeaderBar.dart';
//import 'widgets/BottomBar.dart';

class NotificationsPage extends StatelessWidget {
  NotificationsPage({super.key});

  Color? background = const Color(0xffFEFFD4);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      home: Scaffold(
        appBar: TopAppBar(AppBar(), 'Settings', const Color(0xffCB9700),Colors.black),
        backgroundColor: background,
        body: Center(
          child: Column(
            verticalDirection: VerticalDirection.down,
         
            children: [
                 const SizedBox(height:50),

            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
              
                style: const ButtonStyle(     
       backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700))
      ),
                onPressed: ()   {           
                },            
                icon: const Icon(
                 Icons.notifications_on,
                 color:Color(0xff2D2D2D), 
                ),
                label: const Text(
                  "All Push Notifications",
                    style: TextStyle(                
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                    )
                ),
              ),
            ),  
              const Spacer(flex: 20),
              
                Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
              
                style: const ButtonStyle(     
       backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700))
      ),
                onPressed: ()   {           
                },            
                icon: const Icon(
                  Icons.notifications_on,
                 color:Color(0xff2D2D2D), 
                ),
                label: const Text(
                  "Order Submitted/In Process/Done",
                    style: TextStyle(                
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                    )
                ),
              ),
            ),  
              const Spacer(flex: 20),
                Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
              
                style: const ButtonStyle(     
       backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700))
      ),
                onPressed: ()   {           
                },            
                icon: const Icon(
                 Icons.notifications_on,
                 color:Color(0xff2D2D2D), 
                ),
                label: const Text(
                  "Order Denied",
                    style: TextStyle(                
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                    )
                ),
              ),
            ),  
              const Spacer(flex: 20),
                Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
              
                style: const ButtonStyle(     
       backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700))
      ),
                onPressed: ()   {           
                },            
                icon: const Icon(
                  Icons.notifications_on,
                 color:Color(0xff2D2D2D), 
                ),
                label: const Text(
                  "Brig Closed",
                    style: TextStyle(                
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                    )
                ),
              ),
            ),  
              const Spacer(flex: 20),
                   Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
              
                style: const ButtonStyle(     
       backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700))
      ),
                onPressed: (               
                )   {  
                      Navigator.push(
                   context, 
                 MaterialPageRoute(builder: (context) => const LoginPage())
               );
                },            
                icon: const Icon(
                  Icons.notifications_on,
                 color:Color(0xff2D2D2D), 
                ),
                label: const Text(
                  "Log Out",
                    style: TextStyle(                
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                    )
                ),
              ),
            ),  
            ],
          )
        ),
      )
    );
  }
}

