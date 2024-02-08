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
  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final order = await userRef.child("users/$name/pastOrders").get();  

  List orders = [];  
  int i = 1;
  do {
    orders.add(order.child("order$i").value.toString());
    i++;
  } while (order.child("order$i").value != null);
  
  List list = [];
  for (int i = 0; i < orders.length; i++) {
    OrderClass usersOrder = OrderClass(orders[i], name);
    String? orderID = usersOrder.orderID;
    var orderNum = await userRef.child("saveOrders/$orderID").get();
    int j = 1;
    do {
      ItemClass item = await itemRead(orderNum.child("item$j").value.toString());
      usersOrder.items.add(item);
      j++;
    } while (orderNum.child("item$j").value != null);
    list.add(usersOrder);
  }
  return list;
}

Future<void> addSaveOrderItems(List items) async {



}

Future<void> createNewSaveOrder() async {



}

Future<int> getLastedSavedOrder() async {


  return 1006;
}

Future<void> addSavedItem(String item) async {

  //DatabaseReference savedOrderRef = FirebaseDatabase.instance.ref("saveOrder");

  

  /* need to send out a JSON type of data

  INPUT : items = {item1, item2, item3}

  itemN => itemClass Object
  "itemA" = item1.name

    {
      orderNum: {
        item1: "itemA",
        item2: "itemB",
        ...
        itemN: "itemN"
      }
    }
  */
}
