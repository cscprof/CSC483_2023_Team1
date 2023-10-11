
import 'package:brig_project/screens/login.dart';
import 'package:flutter/material.dart';


class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  Color? backgroundColor = Colors.black;
  Color shadowColor = Colors.black;
  String textInput = "testing";
  AppBar appBar;

  TopAppBar(this.appBar, this.textInput, this.backgroundColor, this.shadowColor, {super.key});
  
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
            MaterialPageRoute(builder: (context) => LoginPage())
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
