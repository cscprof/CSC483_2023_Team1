import 'package:flutter/material.dart';
import 'widgets/HeaderBar.dart';
import 'widgets/BottomBar.dart';
import '../data/itemdata.dart';
import 'home.dart';

// final List<String> items = <String>['Entrees', 'Sides', 'Fruit', 'Dessert', 'Drinks'];
// final List<int> colorCodes = <int>[600, 500, 400, 300, 200];

ItemData item = ItemData();

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  // @override
  // State<OrderPage> createState() => _OrderPageState();
// }

// class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Order Page",
      home: Scaffold(
        appBar: TopAppBar(AppBar(), "New Order"),
        body: const Column(children: [Expanded(flex: 1, child: ListViewBuilder()),],),
        backgroundColor: const Color(0xffFEFFD8),
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      )
      );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

//   @override
//   State<ListViewBuilder> createState() => _ListViewBuilderState();
// }

// class _ListViewBuilderState extends State<ListViewBuilder> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          for (var item in item.menuItems) ...[
          //   Row(children: [
          //     Image.asset(item['image'], height: 50, width: 50,),
          //     Text(item['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),),
          //     IconButton(onPressed: () {
          //       // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));}, 
          //       debugPrint("Button pressed!!");},
          //       icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.black,))
          // ],),
          // const Divider(
          //       height: 20,
          //       thickness: 2,
          //       indent: 0,
          //       endIndent: 10,
          //       color: Colors.black,)
          // ]
          ListTile(
            tileColor: const Color(0xfffeffe8),
            title: Text(item['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff2D2D2D)), textAlign: TextAlign.center,),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff2D2D2D),),
            leading: ClipRRect(borderRadius: BorderRadius.circular(35), 
              child: Image.asset(item['image'], width: 50, height: 50),),
            contentPadding: const EdgeInsets.all(20.0),
            onTap: () {
              debugPrint("Button pressed!");
            },
            shape: const Border(
              bottom: BorderSide(width: 1, color: Color(0xff2D2D2D)),
            ),
            // onLongPress: () {debugPrint("Long pressed!");}
            ),
        ],
        ]
      )
    );
  }
}
