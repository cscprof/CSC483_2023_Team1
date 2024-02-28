import 'package:brig_project/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home.dart';
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

  print("end initialization");
  OrderClass ryansOrder = OrderClass("orderN", "ryan");
  ItemClass item1 = ItemClass("Big Cookie", "2.5", "false", "big_cookie.txt", "big_cookie.png");
  ItemClass item2 = ItemClass("Grilled Cheese", "4", "true", "grilled_cheese.txt", "grilled_cheese.png");
  ItemClass item3 = ItemClass("Green Apple", "1.5", "true", "green_apple.txt", "green_apple.png");
  ryansOrder.items = [item1, item1, item1];
  print("items created, adding new order");
  addNewOrder(ryansOrder);
  print("addNewOrder FIN");

  // List pastOrders = await getPastOrders("zoe");
  // for(int i = 0; i < pastOrders.length; i++){
  //   OrderClass pastOrder = pastOrders[i];
  //   print("User : ");
  //   print(pastOrder.user);
  //   print("Order : ");
  //   print(pastOrder.orderID);
  //   pastOrder.items.forEach((item) { 
  //     ItemClass _item = item;
  //     print(_item.name);

  //   });
  // }

  standardStudentNewUser("joe", "pjoe");
  
  // angela -- took this out
  runApp(const HomePage()); // insert class name
  //runApp(const MaterialApp(home: HomePage(),));
} 
// ------------------ RUN TO SEE GENERAL PAGES ------------------ //
// void main() {
//   runApp(const HomePage());
// }
