import 'package:brig_project/firebase/items.dart';
import 'package:firebase_database/firebase_database.dart';
import 'orders.dart';
//import 'items.dart';

class UserClass  {
  String name;
  String password;
  List<ItemClass> cart = [];
  List<OrderClass> pastOrders = [];
  
  // add different information here that should be used when loged into the app

  UserClass(this.name, this.password) {
    retrievePastOrders();
  }

  void retrievePastOrders() async {
    pastOrders = await getPastOrders(name);
  }

  void submitCart() {
    OrderClass submitOrder = OrderClass("1011", name);
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

  int totalSwipes() {
    int total = 0;

    return total;
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

