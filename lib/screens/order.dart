import 'package:brig_project/screens/subcat1.dart';
import 'package:flutter/material.dart';
import 'widgets/HeaderBar.dart';
import 'widgets/BottomBar.dart';
import '../data/itemdata.dart';

ItemData item = ItemData();

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          for (var item in item.menuItems) ...[
          ListTile(
            tileColor: const Color(0xfffeffe8),
            title: Text(item['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff2D2D2D)), textAlign: TextAlign.center,),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Color(0xff2D2D2D),),
            leading: ClipRRect(borderRadius: BorderRadius.circular(35), 
              child: Image.asset(item['image'], width: 50, height: 50),),
            contentPadding: const EdgeInsets.all(20.0),
            onTap: () async {
              // Get the selected item's information from the database
              final thisSelectedCategory = item['selectedCategory'];

              // Navigate to the SubCat1Page and pass the selected item's information
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SubCat1Page(selectedCategory: thisSelectedCategory),
              ));
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
