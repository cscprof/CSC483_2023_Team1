import 'package:brig_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home.dart';
/*import 'package:firebase_database/firebase_database.dart';
import 'data/items.json';
import 'firebase_options.dart';
import 'firebase/items.dart';
import 'firebase/users.dart';
import 'firebase/orders.dart';
import 'screens/login.dart';
import 'screens/order.dart';
import 'screens/settings.dart';
import 'screens/cart.dart'; */

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  /*UserClass userInput = await userRead("angela");
  print(userInput.name);
  print(userInput.password);

  ItemClass item = await itemRead("wrap");
  print(item.name);
  print(item.isSwipe);
  print(item.icon);
  print(item.price);

  List pastOrders = await getPastOrders("ryan");
  for(int i = 0; i < pastOrders.length; i++){
    ItemClass pastItem = pastOrders[i];
    print(pastItem.name);
  }
  */
  // angela -- took this out
  //runApp(const HomePage()); // insert class name
  runApp(const MaterialApp(home: HomePage(),));
} 
// ------------------ RUN TO SEE GENERAL PAGES ------------------ //
// void main() {
//   runApp(const HomePage());
// }
