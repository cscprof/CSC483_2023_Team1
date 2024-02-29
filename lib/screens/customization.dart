import 'package:flutter/material.dart';
import 'widgets/bottombar.dart';
import 'widgets/customizationWidget.dart';

class CustomizationPage extends StatelessWidget {
  final String selectedCustomization; // the selected menu item
  const CustomizationPage({required this.selectedCustomization, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> customizationOptions = ['Chicken','Cheese','Lettuce', 'Tomato', 'Cucumber', 'Egg','Croutons', 'Ranch']; // Define customization options here
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffCB9700),
          title: Text(selectedCustomization, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white,),),
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
              child: CustomizationListView(
                customizationOptions: customizationOptions,
                onCustomizationSelected: (selectedOptions) {
                  // Handle the selected options (e.g., add them to the cart)
                }),
            ),
          ],
        ),
        backgroundColor: const Color(0xffFEFFD8),
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      ), 
    );
  }
}
