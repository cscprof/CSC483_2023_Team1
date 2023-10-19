import 'package:flutter/material.dart';
import 'widgets/HeaderBar.dart';
//import 'widgets/BottomBar.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  Color? background = Colors.grey[400];

  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      color: Colors.yellow[200],
      home: Scaffold(
        appBar: TopAppBar(AppBar(), 'Settings', Colors.yellow[200], Colors.black),
        backgroundColor: background,
        body: Center(
          child: Column(
            verticalDirection: VerticalDirection.down,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {
                  print('Notifications Button Pressed!!!!');
                  background = Colors.red[300];
                },
                child: const Text('Notifications')
              ),
              const Spacer(flex: 1,),
              OutlinedButton(
                onPressed: () {
                  print('Logout Button Pressed');
                  background = Colors.blue[300];
                },
                child: const Text('Logout'),
              ),
              const Spacer(flex: 50),
            ],
          )
        ),
      )
    );
  }
}

