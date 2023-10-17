import 'package:flutter/material.dart';
import 'widgets/HeaderBar.dart';
import 'widgets/BottomBar.dart';

final List<String> items = <String>['Entrees', 'Sides', 'Fruit', 'Dessert', 'Drinks'];
// final List<int> colorCodes = <int>[600, 500, 400, 300, 200];

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Order Page",
      home: Scaffold(
        appBar: TopAppBar(AppBar(), "New Order", Colors.yellow, Colors.black),
        body: const Column(children: [Expanded(flex: 1, child: ListViewBuilder()),],),
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      )
      );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 60,
          // color: Colors.amber[colorCodes[index]],
          child: TextButton(
            onPressed: () {}, 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(items[index], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
                const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,)
              ],
            )
            )
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      );
  }
}

