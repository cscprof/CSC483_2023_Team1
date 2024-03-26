import 'package:firebase_database/firebase_database.dart';
import 'items.dart';

class OrderClass {
  String orderID = "blank";
  String user = "blank";
  List items = [];

  OrderClass(String o, String u) {
    orderID = o;
    user = u;
  }
}


/*
  getPastOrders Description:
    
    PURPOSE: 

    INPUT: 

    OUTPUT: 

    ORDER OBJECTS: 
*/

Future<List> getPastOrders(String name) async {
  // able to get item from user past order

  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final order = await userRef.child("orders/$name").get(); 
  // !! TODO - if the user does not have a past order it crashes

  List orders = [];  
  int i = 0;
  do {
    OrderClass usersOrder = OrderClass("order$i", name);
    String? orderID = usersOrder.orderID;
    var itemRef = await userRef.child("orders/$name/$orderID/items").get(); 
    int j = 0;
    do {
      String testing = itemRef.child("item$j").value.toString();
      ItemClass item = await itemRead(testing); 
      usersOrder.items.add(item);
      j++;
    } while (itemRef.child("item$j").value != null);
    orders.add(usersOrder);
    i++;

  } while (order.child("order$i").value != null);

  return orders;
}

Future<void> addNewOrder(OrderClass order) async {
  // add new order that the user just submitted
  // need to check if user has an order history

  // this is so ugly wow has to be a better way
  // hopefully making a reference to the database is not that taxing on application
  
  String user = order.user;
  // find what was the latest order by looping through all current orders
  // very slow, definitly a better way??
  DatabaseReference ordersRef = FirebaseDatabase.instance.ref("orders");
  final currentOrder = await ordersRef.child(user).get();
  int i = 0;
  while(currentOrder.child("order$i").value != null) {
    i++;
  }
  print("Current order: order$i");
  // using the last order found, make a new order and update within the users profile
  DatabaseReference newOrderRef = FirebaseDatabase.instance.ref("orders/$user");
  await newOrderRef.update({
    "order$i" : {
      "favorite" : false,
      "last_ordered" : DateTime.now().toString(), // will this work? 
      "items" : {}
    }
  });
  print("uploaded order JSON");
  // add the items individually in the "items" part of the order
  DatabaseReference newItemsRef = FirebaseDatabase.instance.ref("orders/$user/order$i/items");
  int j = 0;
  for (int j = 0; j < order.items.length; j++) {
    String itemID = "item$j";
    ItemClass item = order.items[j];
    print("current item: $itemID");
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

