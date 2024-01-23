import 'dart:convert';

import 'package:brig_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_database/firebase_database.dart'; 
import 'firebase/users.dart';
import 'firebase/items.dart';
//import 'firebase_options.dart';
//import 'screens/login.dart';
import 'screens/reorder.dart';
import 'screens/home.dart';
import 'screens/order.dart';
import 'screens/settings.dart';
import 'screens/cart.dart';

// -------------------- RUN TO WORK WITH DATABASE ----------------- //
Future<void> main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  // test userInput function
  UserClass userInput = await userRead("angela");
  print(userInput.name);
  print(userInput.password);

  // test itemRead function
  ItemClass muffins = await itemRead("muffins"); // !!
  print(muffins.name);
  print(muffins.isSwipe);
  print(muffins.icon);
  print(muffins.price);

  // test categoryRead function
  List sides = await categoryRead("side");
  sides.forEach( (item) {
     ItemClass currentItem = item;
     print(currentItem.name);
  });
  
  runApp(const HomePage()); // insert class name
}
// ------------------ RUN TO SEE GENERAL PAGES ------------------ //
// void main() {
//   runApp(const HomePage());
// }

