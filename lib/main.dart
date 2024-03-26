import 'package:brig_project/firebase_options.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'data/items.json';
import 'firebase_options.dart';
import 'firebase/items.dart';
import 'firebase/users.dart';
import 'firebase/orders.dart';
import 'screens/login.dart';
import 'screens/order.dart';
import 'screens/settings.dart';
import 'screens/cart.dart'; 

Future<void> main() async {

  print("starting initialization");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );


  // String item = "cheeseburger";
  // print('starting');
  // ItemClass cheeseburger = await itemRead(item);
  // print('got ' + cheeseburger.name);
  // List<SubItemClass> subCat = cheeseburger.subCategoryItems;
  // print('current length: ' + subCat.length.toString());
  // for(int i = 0; i < subCat.length; i++) {
  //   SubItemClass currentSubItem = subCat[i];
  //   print("Current Sub Category for $item: " + currentSubItem.name);
  // }
  // print('done');



  // angela -- took this out
  //runApp(const HomePage()); // insert class name

  runApp(const MaterialApp(home: LoginPage(),));
} 
// ------------------ RUN TO SEE GENERAL PAGES ------------------ //
// void main() {
//   runApp(const HomePage());
// }
