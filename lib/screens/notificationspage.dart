
import 'package:brig_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'widgets/headerSettingsN.dart';
import 'widgets/BottomBar.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     home: Scaffold(
        appBar: SettingsAppBar2(AppBar(), 'All Notifications'),
        body: Center(
            child: ListView(               
                  children: [            
                      ListTile( 
                        leading: const Icon( Icons.fastfood_rounded),
                         title: const Text("Order No. 6790 is ready for pickup"),
                         trailing: const Icon( Icons.remove_circle_outline_rounded),
                            onTap:() {
                               
                              }
                      ),
                        ListTile( 
                        leading: const Icon( Icons.fastfood_rounded),
                         title: const Text("Order No. 6790 is in process"),
                         trailing: const Icon( Icons.remove_circle_outline_rounded),
                            onTap:() {
                               
                              }
                      ),  ListTile( 
                        leading: const Icon( Icons.fastfood_rounded),
                         title: const Text("Order No. 6790 was confirmed"),
                         trailing: const Icon( Icons.remove_circle_outline_rounded),
                            onTap:() {
                               
                              }
                      ),  ListTile( 
                        leading: const Icon( Icons.fastfood_rounded),
                         title: const Text("Order No. 6790 was submitted"),
                         trailing: const Icon( Icons.remove_circle_outline_rounded),
                            onTap:() {
                               
                              }
                      ),  ListTile( 
                        leading: const Icon( Icons.fastfood_rounded),
                         title: const Text("Order No. 6743 was denied by staff: Out of Stock Item"),
                         trailing: const Icon( Icons.remove_circle_outline_rounded),
                            onTap:() {
                               
                              }
                      ),  ListTile( 
                        leading: const Icon( Icons.fastfood_rounded),
                         title: const Text("Order No. 6743 was submitted"),
                         trailing: const Icon( Icons.remove_circle_outline_rounded),
                            onTap:() {
                               
                              }
                      ),  ListTile( 
                        leading: const Icon( Icons.fastfood_rounded),
                         title: const Text("Order No. 6423 is ready for pickup"),
                         trailing: const Icon( Icons.remove_circle_outline_rounded),
                            onTap:() {
                               
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
