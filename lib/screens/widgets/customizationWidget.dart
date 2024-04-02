// import 'package:brig_project/screens/cart.dart';
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomizationListView extends StatefulWidget {
  final List<String> customizationOptions;
  final Function(List<String>) onCustomizationSelected;

  const CustomizationListView({required this.customizationOptions, required this.onCustomizationSelected, super.key});
  @override
  _CustomizationListViewState createState() => _CustomizationListViewState();
}

class _CustomizationListViewState extends State<CustomizationListView> {
  List<bool> _checkedList = [];

  @override
  void initState() {
    super.initState();
    _checkedList = List<bool>.filled(widget.customizationOptions.length, false);
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
            itemCount: widget.customizationOptions.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border(top: index == 0 ? const BorderSide(width: 1, color: Color(0xff2D2D2D)) : BorderSide.none, bottom: const BorderSide(width: 1, color: Colors.black)),
                  color: const Color(0xfffeffe8), // background color
                ),
                child: CheckboxListTile(
                  title: Text(widget.customizationOptions[index], style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                  secondary: const Icon(Icons.fullscreen_outlined, size: 30, color: Colors.black,),
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: _checkedList[index],
                  onChanged: (bool? value) {
                    setState(() {
                      _checkedList[index] = value ?? false;
                      widget.onCustomizationSelected(getSelectedOptions());
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
              widget.onCustomizationSelected(getSelectedOptions());
              // List<String> selectedOptions = widget.onCustomizationSelected(getSelectedOptions());
              // MaterialPageRoute(builder: (context) => CartPage(selectedCustomization: items[index].name,),
              debugPrint('Submit button pressed!');
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffCB9700)),),
            child: const Text('Submit', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }

  List<String> getSelectedOptions() {
    List<String> selectedOptions = [];
    for (int i = 0; i < _checkedList.length; i++) {
      if (_checkedList[i]) {
        selectedOptions.add(widget.customizationOptions[i]);
      }
    }
    return selectedOptions;
  }
}