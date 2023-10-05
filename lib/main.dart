import 'package:flutter/material.dart';
import 'screens/login.dart';
//import 'screens/home.dart';
//import 'screens/order.dart';

void main() {
  // initialize firebase
  // run the app, starting at login.dart
  // 

  runApp(LoginPage()); // insert class name
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(255, 200, 147, 210),
//           shadowColor: Colors.red[400],
//           title: Title(
//             color: Colors.black,
//             title: "Testing Page",
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('THIS IS THE MAIN PAGE - Angela'),
//                 Spacer(flex: 5),
//                 Tab(icon: Icon(Icons.airplane_ticket)),
//                 Spacer(),
//                 Tab(icon: Icon(Icons.airplanemode_active)),
//                 Spacer(),
//                 Tab(icon: Icon(Icons.alarm)),
//                 Spacer(),
//                 Text("Welcome to the Brig"),
//               ],
//             ),
//           )
//         ),
//         body: const Center(
//           child: Column(
//             children: [
//               Text(
//                 'Italic style text', 
//                 style: TextStyle(fontStyle: FontStyle.italic),
//               ),
//               Text(
//                 'Normal text',
//                 style: TextStyle(fontStyle: FontStyle.italic)),
//               Text(
//                 'Size of text is 30',
//                 style: TextStyle(fontSize: 30.0)),
//               Text(
//                 'Italic, size 50 and BOLD',
//                 style: TextStyle(
//                   fontStyle: FontStyle.italic,
//                   fontSize: 50,
//                   fontWeight: FontWeight.bold
//                 ),),
//             ],
//           ),
//         ),

//         // want to add a bottom sheet of some sort, but confused on 
//         // what onClosing is and how to use it

//         /*bottomSheet: BottomSheet(
//           backgroundColor: Colors.yellow[400],
//           shadowColor: Colors.blue[300],
//           onClosing: 
//         )*/
//       )
//     );

//   }

//   // look at current time, output value

//   DateTime currentTime() {
//     return DateTime.now();
//   }

// }
