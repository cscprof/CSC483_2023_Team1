//import 'package:brig_project/screens/login.dart';
//import 'package:brig_project/screens/settings.dart';
import 'package:flutter/material.dart';
import 'widgets/headerSettingsN.dart';
import 'widgets/bottombar.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage ({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool allOn = false;
  bool progress = false;
  bool denied = false;
  bool closed = false;
  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: allOn ? ThemeData.light() : ThemeData.light(),
      child: Scaffold(
        appBar: SettingsAppBar2(AppBar(), 'Notification Settings'),
        body: Center(
            child: ListView(               
                  children: [           
                    ListTile(
                        title: const Text( "All Push Notifications"),
                       leading: const Icon(Icons.notification_add_outlined),
                       trailing: Switch(
                             value: allOn,
                            onChanged: (value) {
                              setState(() {
                                allOn = value;
                              });
                            })),
                      ListTile(
                        title: const Text( "Order Submitted/In Process/Done"),
                       leading: const Icon(Icons.notification_add_outlined),
                       trailing: Switch(
                             value: progress,
                            onChanged: (value) {
                              setState(() {
                                progress = value;
                              });
                            })),
                         ListTile(
                        title: const Text( "Order Denied"),
                       leading: const Icon(Icons.notification_add_outlined),
                       trailing: Switch(
                             value: denied,
                            onChanged: (value) {
                              setState(() {
                                denied = value;
                              });
                            })),
                       ListTile(
                        title: const Text( "Brig Closed"),
                       leading: const Icon(Icons.notification_add_outlined),
                       trailing: Switch(
                             value: closed,
                            onChanged: (value) {
                              setState(() {
                                closed = value;
                              });
                            })),  
                     
                  ],
                ),       
            ),
             bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
          ),
        ); 
  }
}




