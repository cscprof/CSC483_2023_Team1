<<<<<<< HEAD
// import 'package:flutter/material.dart';

// class OrderPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'OrderPage',
//       home: const OrderPage(),
//     );
//   }
// }

// class OrderPage extends StatefulWidget {
//   const OrderPage({super.key});

//   @override
//   _OrderPageState createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> {
//   final List<String> items = [
//     'Entree', 
//     'Sides',
//     'Fruit',
//     'Dessert',
//     'Drinks'
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Start New Order'),
//       ),
//       body: ListView.builder(
//         itemCount: items.length,
//         itemBuilder: (BuildContext context) {
//           return ListTile(
//             leading: Icon(
//               Icons.circle,
//             ),
//             title: Text(items[index]),
//             // subtitle: Text(''),
//             trailing: const Icon(Icons.arrow_forward),
//             onTap: () {}
//           )
//         }
//       )
//     )
//   }

// }
=======
import 'package:flutter/material.dart';
import 'widgets/HeaderBar.dart';
import 'widgets/BottomBar.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: TopAppBar(AppBar(), "Start New Order", Colors.yellow, Colors.black),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [],
        ),
        ),
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      )
      );
  }
}


/* ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context) {
          return ListTile(
            leading: Icon(
              Icons.circle,
            ),
            title: Text(items[index]),
            // subtitle: Text(''),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {}
          )
        }
      ), */
>>>>>>> b0f49caad40808a0c94ca40284bf3c5ca0200891
