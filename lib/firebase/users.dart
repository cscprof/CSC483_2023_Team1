import 'dart:convert';
// import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
//import 'package:flutter/foundation.dart';
import 'items.dart';

class UserClass  {
  String name;
  String password;

  UserClass(this.name, this.password);
}

UserClass userErr = UserClass('err', 'err');

// Read name from user JSON 
Future<UserClass> userRead(String user) async {
  
  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final event = await userRef.child("users/$user").get();  
  
  if(!event.exists) {
    return userErr;
  }

  String name = event.child("name").value.toString(); // disgusting
  String password = event.child("password").value.toString();
  
  UserClass snapshot = UserClass(name, password);
  
  return snapshot;

}

Future<bool> isLoginCorrect(String username, String password) async {

  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final event = await userRef.child("users/$username").get();  
  
  if(!event.exists) { // if username doesnt exist
    return false;
  }

  if (password != event.child("password").value.toString()) { // if password doesnt match
    return false;
  }

  return true;
}

// list of UserClass Objects??
// map of objects?? 

// might need to return map that divides every item into its order numbers

Future<List> getPastOrders(String name) async {
  // able to get item from user past order
  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final order = await userRef.child("users/$name/pastOrders").get();  

  // get all orders
  List orders = [];
  for(int i = 1; i < 2; i++) { // Ryan - 1002 , 1003
    orders.add(order.child("order$i").value.toString());
  }

  //get items from each order
  List items = [];
  for (int i = 0; i < orders.length; i++) {
    String order = orders[i];
    print(order);
    var orderNum = await userRef.child("saveOrders/$order").get();
    for (int j = 1; j < 5; j++) { // Ryan - powerade, fountain_drink, wrap, cup_yogurt
      items.add(orderNum.child("item$j").value.toString());
    }
  }

  // get item features from items selected
  List list = [];
  for (int i = 0; i < 5; i++) {
    ItemClass itemDrink = await itemRead("drink", items[i]);
    ItemClass itemEntree = await itemRead("entree", items[i]);
    ItemClass itemFruit = await itemRead("fruit", items[i]);
    ItemClass itemSide = await itemRead("side", items[i]);
    ItemClass itemDessert = await itemRead("dessert", items[i]);

    // NASTY !! TODO : Get the stupid searchign algorithm working

    if (itemDrink.name != "err") { // while there is no error
      list.add(itemDrink);
    }
    if (itemEntree.name != "err") { // while there is no error
      list.add(itemEntree);
    }
    if (itemFruit.name != "err") { // while there is no error
      list.add(itemFruit);
    }
    if (itemSide.name != "err") { // while there is no error
      list.add(itemSide);
    }
    if (itemDessert.name != "err") { // while there is no error
      list.add(itemDessert);
    }
    
  }

  return list;

}
