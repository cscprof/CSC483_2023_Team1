import 'package:brig_project/firebase/users.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'items.dart';

class OrderClass {
  String orderID = "blank";
  String user = "blank";
  bool isFavorite = false;
  List<ItemClass> items = [];
  List<SwipeClass> swipeItemSelected = [];

  OrderClass(String o, String u, bool f) {
    orderID = o;
    user = u;
    isFavorite = f;
  }

  double totalPrice() {
    double total = 0;
    for (int i = 0; i < items.length; i++) {
      total += items[i].price;
    }
    return total;
  }

  void addItemToSwipe(ItemClass item) {
    if(swipeItemSelected.isEmpty) { // if there is not an item selected just yet
      SwipeClass swipe = SwipeClass();
      swipe.swipeObject.update(item.category, (value) => item);
      swipeItemSelected.add(swipe);
      debugPrint('No current swipe object, creating new one with item : ${item.category} - ${item.name}');
    } else {
      debugPrint('Total number of swipe objects : ${swipeItemSelected.length}');
      for (int i = 0; i < swipeItemSelected.length; i++) { 
        if (swipeItemSelected[i].swipeObject[item.category] == Null) { // if the category is not filled
          swipeItemSelected[i].swipeObject[item.category] = item;
          debugPrint('Swipe object ${i+1} has a spot to fill : ${item.category} - ${item.name}');
          break;
          // need to leave forloop when its done
        } else if (i == swipeItemSelected.length-1 && swipeItemSelected[i].swipeObject[item.category] != Null) { // at end of list, need to add a new swipe to input item
          SwipeClass newSwipe = SwipeClass();
          swipeItemSelected.add(newSwipe);  
          debugPrint('Searched all swipe objects, making a new one');
        } 
      }
    }
    debugPrint('--fin--');
  }
}

class SwipeClass {
  Map<String, Object> swipeObject = {
    "entree" : Null,
    "side" : Null,
    "fruit" : Null,
    "drink" : Null, 
    "dessert" : Null
  };
}
/*
  getPastOrders Description:
    
    PURPOSE: 

    INPUT: 

    OUTPUT: 

    ORDER OBJECTS: 
*/
String printSwipeClass (SwipeClass swipe) {
  return 'Entree : ${swipe.swipeObject['entree']}\nSide : ${swipe.swipeObject['side']}\nFruit : ${swipe.swipeObject['fruit']}\nDrink : ${swipe.swipeObject['drink']}\nDessert : ${swipe.swipeObject['dessert']}';
}
Future<List<OrderClass>> getPastOrders(String name) async {
  // able to get item from user past order
  // TODD - get only 5 most recent based on ti
  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final order = await userRef.child("orders/$name").get(); 
 
  debugPrint('Running getPastOrders for $name');
  List<OrderClass> orders = [];  
  int i = 0;
  do { // this is getting stuck here why ? 
    OrderClass usersOrder = OrderClass("order$i", name, false);
    String? orderID = usersOrder.orderID;
    var itemRef = await userRef.child("orders/$name/$orderID/items").get(); 
    if (!itemRef.exists) {
      debugPrint('breaking - itemRef does not exist');
      return orders;
    }
    int j = 0;
    do { // get every item in saved orders
      String testing = itemRef.child("item$j").value.toString();
      ItemClass item = await itemRead(testing); 
      usersOrder.items.add(item);
      j++;
    } while (itemRef.child("item$j").exists);
    bool isFavoriteResult = order.child("$orderID/favorite").value as bool;
    usersOrder.isFavorite = isFavoriteResult;
    orders.add(usersOrder);
    i++;
  } while (order.child("order$i").exists);
  debugPrint('got ${orders.length} orders');
  return orders;
}

Future<void> addNewOrder(OrderClass order) async {
  debugPrint("Adding order: ${order.orderID} for ${order.user}");
  // ignore: avoid_function_literals_in_foreach_calls
  order.items.forEach((element) {
    debugPrint('Item : ${element.name}');
  },);
  // add new order that the user just submitted
  // need to check if user has an order history

  // this is so ugly wow has to be a better way
  // hopefully making a reference to the database is not that taxing on application
  
  String user = currentUser.name;
  // find what was the latest order by looping through all current orders
  // very slow, definitly a better way??
  DatabaseReference ordersRef = FirebaseDatabase.instance.ref("orders");
  var currentOrder = await ordersRef.child(user).get();
  if (!currentOrder.exists) {
    ordersRef.update({
      user : ""
    });
    currentOrder = await ordersRef.child(user).get();
  }
  int i = 0;
  while(currentOrder.child("order$i").value != null) {
    i++;
  }
  // using the last order found, make a new order and update within the users profile
  DatabaseReference newOrderRef = FirebaseDatabase.instance.ref("orders/$user");
  await newOrderRef.update({
    "order$i" : {
      "favorite" : order.isFavorite,
      "last_ordered" : DateTime.now().toString(), 
      "items" : {},      
    }
  });
  // add the items individually in the "items" part of the order
  DatabaseReference newItemsRef = FirebaseDatabase.instance.ref("orders/$user/order$i/items");
  for (int j = 0; j < order.items.length; j++) {
    String itemID = "item$j";
    ItemClass item = order.items[j];
    await newItemsRef.update({
      itemID : item.name.toLowerCase().replaceAll(' ', '_')
    });
  }
  
}

// add the current order to the "active_orders" section in firebase

// update the order that is completed within the "active_orders" section

Future<void> estimateTime() async {
  // calulate the estimate time of the order based on factors from
  // the database and the current order
}

// delete old orders that are past a certain date from last use

// will I need a make "order purchase/made" package function? 

