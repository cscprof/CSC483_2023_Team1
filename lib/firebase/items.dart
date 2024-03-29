import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ItemClass {
  String name = "temp_name"; // why do I have to question these?
  double price = 0.0; // convert to int
  bool isSwipe = false; // convert to bool
  String descript = "temp_desc";
  Image? icon; // change to different object

  bool isErr = false; // error bit if returned false value

  ItemClass(String n, String p, String s, String d, String i) {
    if (name == 'err') {
      isErr = true;
    }
    name = n;
    price = double.parse(p);
    isSwipe = s.toLowerCase() == 'true';
    descript = d;
    icon = Image.network(i);
  }


  /* 
    
      Create a funcion that return an images object form the web link
  */
  // get icon
  String getIcon () {
    //  will get the icon that is stored on app
    return "temp icon";
  }

}

// error item object
ItemClass errorItem = ItemClass('err', '0.0', 'false', 'err', 'err');

/*
  itemRead Description:
    
    PURPOSE: retrieve an individual item desired

    INPUT: item name

    OUTPUT: ItemClass
    
*/

Future<ItemClass> itemRead(String item) async {
  List categories = ["drink", "entree", "fruit", "side", "dessert"];
  DatabaseReference itemRef = FirebaseDatabase.instance.ref();
  DataSnapshot event; 
  int i = 0;

  do { 
    String category = categories[i];
    event = await itemRef.child("items/$category/$item").get();
    i++;
    if (i > 5) {
      // if item does not exist
      return errorItem;
    }
  } while (!event.exists); // change this??

  String name = event.child("name").value.toString();
  String price = event.child("price").value.toString();
  String isSwipe = event.child("isSwipe").value.toString();
  String descript = event.child("description").value.toString();
  String icon = event.child("icon").value.toString();

  ItemClass snapshot = ItemClass(name, price, isSwipe, descript, icon);

  return snapshot;
}


/*
  categoryRead Description:
    
    PURPOSE: return all of the items found in a specific categoy

    INPUT: cateogry name

    OUTPUT: List - ItemObjects
    
*/
Future<List<ItemClass>> categoryRead(String category) async {
  /*
    
      error handle when a bad category is inputted
  */
  List<ItemClass> items = [];
  DatabaseReference categoryRef = FirebaseDatabase.instance.ref("items/$category");

  await categoryRef.get().then((snapshot) {
    for (final item in snapshot.children) {
      String name = item.child("name").value.toString();
      String price = item.child("price").value.toString();
      String isSwipe = item.child("isSwipe").value.toString();
      String descript = item.child("description").value.toString();
      String icon = item.child("icon").value.toString();

      ItemClass snapshot = ItemClass(name, price, isSwipe, descript, icon);
      items.add(snapshot);
    }
  });

  return items;
}
