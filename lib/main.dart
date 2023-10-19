import 'package:brig_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'screens/login.dart';
import 'screens/home.dart';
import 'screens/order.dart';
import 'screens/settings.dart';

// -------------------- RUN TO WORK WITH DATABASE ----------------- //
Future<void> main() async {
  // initialize firebase, waitinf to connect with firebase
  // need to set up firebase for this to work, just spinning
  print("Initializing Firebase");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  print("Starting Page");
  // run the app, starting at login.dart
  // 

  runApp(const HomePage()); // insert class name
}
// // ------------------ RUN TO SEE GENERAL PAGES ------------------ //
// void main() {
//   runApp(const HomePage());
// }

