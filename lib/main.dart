import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Testing!!! It works!! Haylee, Ryan, Zoe'),
        ),
      ),
    );
  }

  // look at current time, output value

  DateTime currentTime() {
    return DateTime.now();
  }

}
