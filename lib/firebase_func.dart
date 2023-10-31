import 'package:firebase_database/firebase_database.dart';

//------------ get data functions ------------------

void userReadDatabase(DatabaseReference userRef) {
  // continuously read the reference to look for changes
  // listens for changes
  userRef.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value;
    
  });
}

Future<void> userGetValueDatabase(String path) async {
  // read the data once, try to get user data 
  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child(path).get(); 
  // look for the value at path
  if (snapshot.exists) {
    print(snapshot.value);
  } else {
    print ('No data avaliable');
  }
  // said an overuse of this can cause bandwidth issues
  // recommended to use the once() operation instead to 
  // use a realtime listener which is better for bandwidth
}

Future<void> userOnceValueDatabase() async {
  // good for retrieving data once that WILL NOT CHANGE OFTEN
  // our use case: username && password retrieval
  // final ref = FirebaseDatabase.instance.ref();
  // final event = await ref.once(DatabaseEventType.value);
  // final username = event.snapshot.value?.username ?? 'Anonymous';
}

//------------------- Write Data Functions --------------------

Future<void> userWriteNew(DatabaseReference ref, String name, String password) async{
  // create a new user
  await ref.set({
    "name": name,
    "password" : password,
  });
}

Future<void> userWriteItem(DatabaseReference ref, String item, String input) async{
  // update a single item in database
  await ref.update({
    input: item,
  });
}

//--------------- Updating Data Functions -------------------

void updateNewUser(String username, String password) async {
  final newUser = {
    'username' : username,
    'password' : password
  };

  final newUserData = FirebaseDatabase.instance.ref().child('users').push().key;

  final Map<String, Map> updates = {};
  updates['/users/$newUserData'] = newUser;
  
  return FirebaseDatabase.instance.ref().update(updates);
}


