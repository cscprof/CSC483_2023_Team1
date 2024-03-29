
// ignore_for_file: must_be_immutable

import 'package:brig_project/screens/settings.dart';
import 'package:flutter/material.dart';


class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  Color? backgroundColor = const Color(0xffCB9700);
  Color shadowColor = Colors.black;
  String textInput = "testing";
  AppBar appBar;

  TopAppBar(this.appBar, this.textInput, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // actions: [

      // ],
      titleTextStyle: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      leading: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const SettingsPage())
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 12.0,
          textStyle: const TextStyle(color: Colors.white),
          backgroundColor: backgroundColor
        ),
        child: const Icon(Icons.settings)
      ),
      title: Text(textInput),  
      centerTitle: true,
      backgroundColor: backgroundColor,
      shadowColor: shadowColor, 
      //bottom: 
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

}
