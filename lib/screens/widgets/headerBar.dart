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
      actions: [
          const Spacer(),
          Text(textInput, selectionColor: Colors.black,),
          const Spacer(),
          const Icon(Icons.mouse),
          const Spacer(),
          
        ],
        title: Text(textInput),  
        shape: ShapeBorder.lerp(null, null, 0.2),
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

}