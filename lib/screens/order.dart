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