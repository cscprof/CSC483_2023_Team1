import 'package:brig_project/firebase/items.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'orders.dart';
//import 'items.dart';

class UserClass  {
  String name;
  String password;
  List<ItemClass> cart = [];
  List<OrderClass> pastOrders = [];
  List<OrderClass> favoriteOrders = [];
  bool isFavorite = false;
  int totalSwipes = 0;
  //OrderClass order = OrderClass('1001', currentUser.name, false); // crashing bug, cannot do this
  // add different information here that should be used when loged into the app
  //OrderClass currentOrder = OrderClass('001', currentUser.name, false);

  UserClass(this.name, this.password) {
    retrieveOrders();
  }
  
  void retrieveOrders() async {
    pastOrders = await getPastOrders(name);
    debugPrint('Got ${pastOrders.length} orders');
    for(int i = 0; i < pastOrders.length; i++) {
      if(pastOrders[i].isFavorite) {
        favoriteOrders.add(pastOrders[i]);
      }
    }
  }

  void uploadCurrentOrder() {
    OrderClass currentOrder = OrderClass('001', currentUser.name, isFavorite);
    debugPrint('Creating new order to upload : ${currentUser.name} - isFavorite : $isFavorite');
    currentOrder.items = currentUser.cart;
    addNewOrder(currentOrder);
  }

  void updateFlex(double flex) async {
    // TODO : need to change the logic to just be the remaining values
    
    DatabaseReference userRef = FirebaseDatabase.instance.ref('users/');
    final userFlex = await userRef.child(currentUser.name).get();
    String currentFlex = userFlex.child('flex').value.toString();
    double newFlexValue = double.parse(currentFlex) - flex;

    await userRef.child(currentUser.name).update({
      'flex' : newFlexValue
    });
  }

  void updateSwipes(int swipes) async {
    DatabaseReference userRef = FirebaseDatabase.instance.ref('users/');
    final userFlex = await userRef.child(currentUser.name).get();
    String currentSwipes = userFlex.child('swipes').value.toString();
    double newFlexValue = double.parse(currentSwipes) - swipes;

    await userRef.child(currentUser.name).update({
      'swipes' : newFlexValue
    });
  }

  void submitCart() {
    OrderClass submitOrder = OrderClass("1011", name, false);
    submitOrder.items = cart;
    addNewOrder(submitOrder);
  }

  double totalPrice() {
    double total = 0;
    for (int i = 0; i < cart.length; i++) {
      total += cart[i].price;
    }
    return total;
  }

  double priceWithoutFlex() {
    double output = 0.0;
    for (int i = 0; i < cart.length; i++) {
      if (!cart[i].swipeSelectect) {
        output += cart[i].price;
      }
    }
    return output;
  }

  double calcEstTime() {
    double output = 0;
    for(int i = 0; i < cart.length; i++) {
      output += cart[i].timeWeight;
    }
    double tens = output * 100;
    double trunk = tens.truncate() as double;
    return trunk / 100;
  }

  void clearCart() { // maybe stupid but trying to make reading easy -- can adjust if speed is needed
    cart.clear();
    debugPrint('cart is cleared');
  }
  
}

UserClass userErr = UserClass('err', 'err');
UserClass currentUser = UserClass('blank', 'blank'); // current user that is from login ?? 


/*
  userRead Description:
    
    PURPOSE: return a specific user in the form of a UserClass

    INPUT: user name

    OUTPUT: UserClass
    
*/
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
/*
  isLoginCorrect Description:
    
    PURPOSE: return if the login infomration given exist within database

    INPUT: username, password

    OUTPUT: bool - true if login infomration matches 
    
*/

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

/*
  getFlexRemaining Description:
    
    PURPOSE: retrieve the "flex" of the user

    INPUT: user name

    OUTPUT: double - number of "flex"
    
*/
Future<double> getFlexRemaining(String user) async {
  
  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final event = await userRef.child("users/$user").get();
  String output = event.child("flex").value.toString();
  double flex = double.parse(output);
  
  return flex;
}
/*
  getSwipesRemaining Description:
    
    PURPOSE: retrieve the "swipes" of the user

    INPUT: user name

    OUTPUT: double - number of "swipes"
    
*/
Future<double> getSwipesRemaining(String user) async {

  DatabaseReference userRef = FirebaseDatabase.instance.ref();
  final event = await userRef.child("users/$user").get();
  String output = event.child("swipes").value.toString();
  double swipes = double.parse(output);
  
  return swipes;
}

void updateSwipes(String user, double swipes) {
  // update swipes of user to new value
}

void updateFlex(String user, double flex) {
  // update flex of user to new value
}

// TODO - testing adding users to firebase
Future<void> customNewUser(String user, String password, int flex, String role, int swipes) async {
  DatabaseReference usersRef = FirebaseDatabase.instance.ref("users");
  // TODO case for when the user & password does not work
  await usersRef.update({
    user : { // what do I do about the specifics of a standard new user, and a custom new user
      "name": user,
      "password": password,
      "flex": flex,
      "role": role,
      "swipes" : swipes,
    }
  });
  // should the user have an automatic order history created? 
  DatabaseReference ordersRef = FirebaseDatabase.instance.ref("orders");
  await ordersRef.update({
    user : {}
  });

}

// need a checking if all users have an order history associated with it

Future<void> standardStudentNewUser(String user, String password) async {
  customNewUser(user, password, 185, "student", 75);

}


Future<void> deleteUser(String user, String password) async {
  // delete the user if the username and password match

}

