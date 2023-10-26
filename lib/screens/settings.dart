import 'package:brig_project/screens/login.dart';
import 'package:brig_project/screens/notifications.dart';
import 'package:flutter/material.dart';
import 'widgets/HeaderBar.dart';
//import 'widgets/BottomBar.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  Color? background = const Color(0xffFEFFD4);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      home: Scaffold(
        appBar: TopAppBar(AppBar(), 'Settings'),
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
               Navigator.push(
                   context, 
                 MaterialPageRoute(builder: (context) => NotificationsPage())
               );
                print('Notifications Button Pressed');
                  background = Colors.red[300];
                },            
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                 color:Color(0xff2D2D2D), 
                ),
                label: const Text(
                  "Notification Settings",
                    style: TextStyle(
                  
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                    )
                ),
              ),
            ),  
             const Spacer(flex: 50),
               Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
              
                style: const ButtonStyle(     
       backgroundColor: MaterialStatePropertyAll<Color>(Color(0xffCB9700))
      ),
                onPressed: ()   {
               Navigator.push(
                   context, 
                 MaterialPageRoute(builder: (context) => const LoginPage())
               );
                 print('Logout Button Pressed');
                  background = Colors.blue[300];
                },            
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
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
           
              const Spacer(flex: 50),
            ],
          )
        ),
      )
    );
  }
}

