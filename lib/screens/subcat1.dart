import 'package:brig_project/screens/order.dart';
import 'package:flutter/material.dart';
import 'package:brig_project/screens/widgets/orderbottom.dart';
import '../data/itemdata.dart';
import '../firebase/items.dart';
import 'widgets/subcat1widget.dart';

ItemData item = ItemData();

class SubCat1Page extends StatelessWidget {
  final String selectedCategory;

  const SubCat1Page({required this.selectedCategory, super.key});

  @override
  Widget build(BuildContext context) {
    Future<List<ItemClass>> itemsFuture = categoryRead(selectedCategory);

    return MaterialApp(
      title: selectedCategory,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffCB9700),
          title: Text(selectedCategory, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white,),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_rounded),
            onPressed: () {
              // Navigate back to the main subcategory selection
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderPage(),
              ));
            },
            ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Subcat1ListView(itemsFuture: itemsFuture, selectedCategory: selectedCategory),
            ),
          ],
        ),
        backgroundColor: const Color(0xffFEFFD8),
        bottomNavigationBar: OrderBottomBar(AppBar(), WhichPage.menu),
      ),
    );
  }
}
