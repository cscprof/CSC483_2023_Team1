// import 'package:brig_project/screens/cart.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:brig_project/screens/order.dart';
import 'package:flutter/material.dart';
import '../../firebase/items.dart';

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Toppings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Checkbox list for customization options
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.itemCustomize.subCategoryItems.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: index == 0 ? const BorderSide(width: 1, color: Color(0xff2D2D2D)) : BorderSide.none,
                    bottom: const BorderSide(width: 1, color: Colors.black),
                  ),
                  color: const Color(0xfffeffe8), // background color
                ),
                child: CheckboxListTile(
                  title: Text(
                    widget.itemCustomize.subCategoryItems[index].name,
                    style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  secondary: SizedBox(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: widget.itemCustomize.subCategoryItems[index].icon,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: widget.itemCustomize.subCategoryItems[index].isSelected,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.itemCustomize.subCategoryItems[index].isSelected = value!;
                    });
                  },
                  activeColor: const Color(0xffCB9700),
                  checkColor: Colors.black,
                ),
              );
            },
          ),
          // Submit button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderPage()),
                );
                // currentUser.cart.add(widget.itemCustomize); // add to cart
                debugPrint('Submit button pressed! Adding item with customizations to cart.');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffCB9700)),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}