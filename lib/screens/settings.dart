
import 'package:brig_project/screens/login.dart';
import 'package:brig_project/screens/notifications.dart';
import 'package:brig_project/screens/notificationspage.dart';
import 'package:flutter/material.dart';
import 'widgets/headerSettings.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/BottomBar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage ({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

launchURLApp() async {
  var url = Uri.parse("https://www.geneva.edu/student-life/services/security/");
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class _SettingsPageState extends State<SettingsPage> {
  bool night = false;
  @override
  Widget build(BuildContext context) {
    return  Theme(
      data: night ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: SettingsAppBar(AppBar(), 'Settings'),
        body: Center(
            child: ListView(               
                  children: [           
                    ListTile(
                        title: const Text( "Dark Mode"),
                       leading: const Icon(Icons.dark_mode_outlined),
                       trailing: Switch(
                        
                             value: night,
                            onChanged: (value) {
                              setState(() {
                                night = value;
                              });
                            })),
                             ListTile(
                        title: const Text("Notifications"),
                        leading: const Icon( Icons.notification_add_sharp),
                            onTap:() {
                                 Navigator.push(
                                  context, 
                                 MaterialPageRoute(builder: (context) => const NotifPage())
                                 );
                              }
                            ),
                      ListTile(
                        title: const Text("Notification Settings"),
                        leading: const Icon( Icons.notifications_active),
                            onTap:() {
                                 Navigator.push(
                                  context, 
                                 MaterialPageRoute(builder: (context) => const NotificationsPage())
                                 );
                              }
                            ),
                       ListTile(
                        title: const Text("Help"),
                        leading: const Icon( Icons.question_mark_outlined),
                            onTap:() {
                                
                                    launchURLApp();
                                 
                              }
                            ),
                    
                     ListTile(
                        title: const Text("Log Out"),
                        leading: const Icon( Icons.logout_outlined),
                            onTap:() {
                                 Navigator.push(
                                  context, 
                                 MaterialPageRoute(builder: (context) => const LoginPage())
                                 );
                              }
                            ),
            
                
                  ],
                ),    
                   
            ),
             bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
          ),
        ); 
  }
}




