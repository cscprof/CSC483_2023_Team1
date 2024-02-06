// ignore_for_file: must_be_immutable

import 'package:brig_project/screens/home.dart';
import 'package:flutter/material.dart';
//import 'package:brig_project/screens/settings.dart';


class SettingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  Color? backgroundColor = const Color(0xffCB9700);
  String textInput = "Settings Bar";
  AppBar appBar;

  SettingsAppBar(this.appBar, this.textInput, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // actions: [

      // ],
      titleTextStyle: const TextStyle(
        fontSize: 40,
        color: Colors.white,
      ),
      leading: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => const HomePage())
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 12.0,
          textStyle: const TextStyle(color: Colors.white),
          backgroundColor: backgroundColor
        ),
        child: const Icon(Icons.arrow_back_ios_rounded)
      ),
      title: Text(textInput),  
      centerTitle: true,
      backgroundColor: backgroundColor, 
      //bottom: 
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

}
