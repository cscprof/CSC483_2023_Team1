//import 'package:brig_project/firebase/orders.dart';
import 'package:brig_project/firebase_options.dart';
import 'package:brig_project/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'screens/home.dart';
//import 'package:firebase_database/firebase_database.dart';
// import 'data/items.json';
// import 'firebase_options.dart';
//import 'firebase/items.dart';
// import 'firebase/users.dart';
// import 'firebase/orders.dart';
// import 'screens/login.dart';
// import 'screens/order.dart';
// import 'screens/settings.dart';
// import 'screens/cart.dart'; 

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  
  runApp(const MaterialApp(home: LoginPage(),));
  //runApp(const HomePage());
} 

