// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:flutter/material.dart';
import 'widgets/bottombar.dart';
import 'widgets/customizationWidget.dart';
import '../firebase/items.dart';

class CustomizationPage extends StatelessWidget {
  //final String selectedCustomization; // the selected menu item
  final ItemClass selectedItem;
  const CustomizationPage({required this.selectedItem, super.key});
  
  @override
  Widget build(BuildContext context) {
    
    // ignore: unused_local_variable
    List<SubItemClass> customizationOptions = selectedItem.subCategoryItems; // Define customization options here
    print('Item Selected: ' + selectedItem.name);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffCB9700),
          title: Text(selectedItem.name, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white,),),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: CustomizationListView(itemCustomize: selectedItem),
            )
          ],
        ),
        backgroundColor: const Color(0xffFEFFD8),
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      ), 
    );
  }
}
