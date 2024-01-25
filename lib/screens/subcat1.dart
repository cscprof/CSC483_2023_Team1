import 'package:flutter/material.dart';
import 'widgets/HeaderBar.dart';
import 'widgets/BottomBar.dart';
import '../data/itemdata.dart';
import '../firebase/items.dart';
import 'widgets/subcat1Widget.dart';

ItemData item = ItemData();

class SubCat1Page extends StatelessWidget {
  // const SubCat1Page({super.key});
  final String selectedCategory;

  const SubCat1Page({required this.selectedCategory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<ItemClass>> itemsFuture = categoryRead(selectedCategory);
    return MaterialApp(
      title: "Options", // change to display selected subcategory title
      home: Scaffold(
        appBar: TopAppBar(AppBar(), 'Options'),
        body: Column(children: [Expanded(flex: 1, child: Subcat1ListView(itemsFuture: itemsFuture, selectedCategory: selectedCategory)),],),
        backgroundColor: const Color(0xffFEFFD8),
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      )
      );
  }
}

/* class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    
    // List sides = categoryRead("side");
    // get list of items from category => need to make things async and Future<> for it to work - Ryan

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
                child: Image.asset(item['image'], width: 50, height: 50),), // !! temp pic !!
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
} */
