// import 'package:brig_project/screens/cart.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:brig_project/screens/order.dart';
//import 'package:brig_project/screens/subcat1.dart';
import 'package:flutter/material.dart';
import '../../firebase/items.dart';
import '../../firebase/users.dart';

class CustomizationListView extends StatefulWidget {
  final ItemClass itemCustomize;
  const CustomizationListView({required this.itemCustomize, super.key});

  @override
  _CustomizationListViewState createState() => _CustomizationListViewState();
}

class _CustomizationListViewState extends State<CustomizationListView> {

  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          // Separator for toppings and dressings
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Toppings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          // Checkbox list for customization options
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.itemCustomize.subCategoryItems.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(top: index == 0 ? const BorderSide(width: 1, color: Color(0xff2D2D2D)) : BorderSide.none, bottom: const BorderSide(width: 1, color: Colors.black)),
                  color: const Color(0xfffeffe8), // background color
                ),
                child: CheckboxListTile(
                  title: Text(widget.itemCustomize.subCategoryItems[index].name, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  secondary: const Icon(Icons.fullscreen_outlined, size: 30, color: Colors.black,),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: widget.itemCustomize.subCategoryItems[index].isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.itemCustomize.subCategoryItems[index].isSelected = value as bool;
                    });
                  },
                  activeColor: const Color(0xffCB9700),
                  checkColor: Colors.black,
                ),
              );
            },
          ),
          // idea - second container for dressings - separate toppings by group - i.e. veggies, dressings, meat, etc
          ElevatedButton(
            onPressed: () {
              // Call the onCustomizationSelected function with the selected options
              // List<String> selectedOptions = widget.onCustomizationSelected(getSelectedOptions());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OrderPage()) // up to change - Ryan
              );
              currentUser.cart.add(widget.itemCustomize); // add to cart
              debugPrint('Submit button pressed!');
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffCB9700)),),
            child: const Text('Submit', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}