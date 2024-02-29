import 'package:flutter/material.dart';
import 'widgets/bottombar.dart';
import '../data/itemdata.dart';
import '../firebase/items.dart';
import 'widgets/subcat1widget.dart';

ItemData item = ItemData();

class SubCat1Page extends StatelessWidget {
  final String selectedCategory;

  const SubCat1Page({required this.selectedCategory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<ItemClass>> itemsFuture = categoryRead(selectedCategory);

    return MaterialApp(
      title: selectedCategory,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[400],
          title: Text(selectedCategory, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white,),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the main subcategory selection
              Navigator.pop(context);
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
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      ),
    );
  }
}
