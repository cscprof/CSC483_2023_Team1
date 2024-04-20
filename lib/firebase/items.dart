//import 'package:brig_project/screens/notificationspage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ItemClass {
  String name = "temp_name"; // why do I have to question these?
  double price = 0.0; // convert to int
  bool isSwipe = false; // convert to bool
  String descript = "temp_desc";
  String category = "temp_category";
  Image? icon; // change to different object
  bool swipeSelectect = false;
  double timeWeight = 0.0;
  
  List<SubItemClass> subCategoryItems = []; // all of the potential subItems attached to item

  bool isErr = false; // error bit if returned false value

  ItemClass(String n, String p, String s, String d, String i, String subCat, String c, String w) {
    //print('Current item: $n');
    if (name == 'err') {
      isErr = true;
    }
    name = n;
    price = double.parse(p);
    isSwipe = s.toLowerCase() == 'true';
    descript = d;
    icon = Image.network(i);
    category = c;
    timeWeight = double.parse(w);
    
    getSubItem(subCat);
  }

  void getSubItem(String s) async {
    //print('subItem tag is $s');
    List<SubItemClass> subItemList = [];
    if (s == "") return; // return nothing if there is not a subCatItem for item

    DatabaseReference subItemCatRef = FirebaseDatabase.instance.ref("item_custom/$s");

    await subItemCatRef.get().then((snapshot) { // get all items 
      for (final item in snapshot.children) {
        String name = item.child("name").value.toString();
        String icon = item.child("icon").value.toString();
        SubItemClass value = SubItemClass(name, icon);
        //print('Current subItem found: ' + value.name);
        subItemList.add(value);
      }
    });
    
    subCategoryItems = subItemList;
  }

}

class SubItemClass {
  String name = " ";
  Image? icon;
  bool isSelected = false; // if item is selected

  SubItemClass (String n, String i) {
    name = n;
    icon = Image.network(i);
  }
}

SubItemClass blankSubItem = SubItemClass('err', 'err');

// error item object
ItemClass errorItem = ItemClass('err', '0.0', 'false', 'err', 'err', 'err', 'err', 'err');

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
  String category = "";
  do { 
    category = categories[i];
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
  String subCat = event.child("item_custom").value.toString();
  String timeWeight = event.child("timeWeight").value.toString();
  //print('Items subCat: $subCat');

  ItemClass snapshot = ItemClass(name, price, isSwipe, descript, icon, subCat, category, timeWeight);

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
   TODO error handle when a bad category is inputted
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
      String subCat = item.child("item_custom").value.toString();
      String timeWeight = item.child("timeWeight").value.toString();
      
      ItemClass snapshot = ItemClass(name, price, isSwipe, descript, icon, subCat, category, timeWeight);
      items.add(snapshot);
    }
  });

  return items;
}

// TODO :: create a function that will add key (subCat) and value (" ")
Future<void> addItemCustom(String category, List<String> items) async {
  DatabaseReference categoryRef = FirebaseDatabase.instance.ref("item_custom/$category");
  for(int i = 0; i < items.length; i++) {
    String element = items[i];
    String title = element.replaceAll(' ', '_').toLowerCase();
    await categoryRef.update({
      title : {
        "name" : element,
        "icon" : title + ".png" //  maybe?? just trying to add tag at end
      }
    });
  }
}

