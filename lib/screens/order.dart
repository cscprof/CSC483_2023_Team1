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
