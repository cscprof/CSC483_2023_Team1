import 'package:firebase_database/firebase_database.dart';
import 'items.dart';

class OrderClass {
  String? orderID;
  String? user;
  List items = [];

  OrderClass(String o, String u) {
    orderID = o;
    user = u;
  }
}


/*
  getPastOrders Description:
    
    PURPOSE: To retrieve every past order of the user selected. Will be used in
    displaying a quicker options for selecting previous orders. 

    INPUT: the name of the user, which is the username login info that is used to 
    get into the app itself

    OUTPUT: List - A list of order objects in numberical order: order 1001, 1003, 1004, etc
    
    ORDER OBJECTS: Order objects are the individual orders created when a user 
    submitts an order. They contain:
      - orderID :: 1001, 1003, 1004, etc
      - user :: ryan, zoe, etc
      - items :: Item Objects which hold the item and its characteristics
*/

Future<List> getPastOrders(String name) async {
  // able to get item from user past order

  // TODO - what happends when user does not have any past orders

  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final order = await userRef.child("orders/$name").get(); 
  // !! BUG - if the user does not have a past order it crashes

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

Future<void> addNewOrder(String user, OrderClass order) async {
  // add new order that the user just submitted
  // TODO find a way to organize the orders properly

  DatabaseReference usersRef = FirebaseDatabase.instance.ref("users/$user");
  DatabaseReference saveOrdersRef = FirebaseDatabase.instance.ref("saveOrders");


}