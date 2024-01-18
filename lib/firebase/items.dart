import 'package:firebase_database/firebase_database.dart';


/*  Will get items in different manors and output to program
    Uses DATABASE for the JSON information of items & STORAGE
    for the static information and things that are not JSONable
*/ 

class ItemClass {
  String? name; // why do I have to question these?
  double? price; // convert to int
  bool? isSwipe; // convert to bool
  String? descript;
  String? icon;

  bool isErr = false; // error bit if returned false value

  ItemClass(String n, String p, String s, String d, String i) {
    if (name == 'err') {
      isErr = true;
    }
    name = n;
    price = double.parse(p);
    isSwipe = s.toLowerCase() == 'true';
    descript = d;
    icon = i;
  }

  String getDescript () {
    // will get the description text and assign if text is located locally
    return "temp descript";
  }
  // get icon
  String getIcon () {
    // will get the icon that is stored on app
    return "temp icon";
  }

}

// error item object
ItemClass errorItem = ItemClass('err', '0.0', 'false', 'err', 'err');

// TODO : needs to find the item no matter if its in entrees or sides etc.

Future<ItemClass> itemRead(String item) async {

  // need to search database for which locaiton item is in 
  // temporary fix is for the item to have to have the caterogory TODO: make better

  List categories = ["drink", "entree", "fruit", "side", "dessert"];
  DatabaseReference itemRef = FirebaseDatabase.instance.ref(); // TODO
  var event; 
  int i = 0;

  do {
    String category = categories[i];
    event = await itemRef.child("items/$category/$item").get();
    i++;
    if (i > 4) {
      return errorItem;
    }
  } while (event == null); // keep looping until 


  // if (!event.exists) {
  //   return errorItem;
  // }
  String name = event.child("name").value.toString();
  String price = event.child("price").value.toString();
  String isSwipe = event.child("isSwipe").value.toString();
  String descript = event.child("description").value.toString();
  String icon = event.child("icon").value.toString();

  ItemClass snapshot = ItemClass(name, price, isSwipe, descript, icon);

  return snapshot;

}

