import 'package:firebase_database/firebase_database.dart';

class UserClass  {
  String name;
  String password;

  UserClass(this.name, this.password);
}

UserClass userErr = UserClass('err', 'err');

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
