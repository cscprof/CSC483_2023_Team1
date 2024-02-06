// ignore_for_file: must_be_immutable
import 'package:brig_project/screens/cart.dart';
import 'package:flutter/material.dart';

class SettingsAppBar3 extends StatelessWidget implements PreferredSizeWidget {
  Color? backgroundColor = const Color(0xffCB9700);
  String textInput = "Payment Bar";
  AppBar appBar;

  SettingsAppBar3(this.appBar, this.textInput, {super.key});
  
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
                MaterialPageRoute(builder: (context) => CartPage(cartItems: [
                  CartItem(name: 'Item 1', priceInDollars: 10.0, mealSwipes: 0),
                  CartItem(name: 'Item 2', priceInDollars: 5.0, mealSwipes: 0),
                  CartItem(name: 'Item 3', priceInDollars: 8.0, mealSwipes: 0),
                ],)
              )
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
