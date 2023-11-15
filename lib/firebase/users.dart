import 'dart:convert';
import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class UserClass  {
  String name;
  String password;

  UserClass(this.name, this.password);
}

UserClass userErr = UserClass('err', 'err');

// Read name from user JSON 
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

