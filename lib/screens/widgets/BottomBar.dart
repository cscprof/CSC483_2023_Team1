// ignore_for_file: must_be_immutable

/* ------------------------------------------------------------
  10-12/23
  This code NEEDS to be refactored. Set up for just the home page 
  to be able to navigate whenever its ready. Every currently planned 
  page has a bottom bar for it. Please make this code much more
  clearner to work with in the near future.

-------------------------------------------------------------- */

import 'package:brig_project/screens/cart.dart';
import 'package:brig_project/screens/home.dart';
import 'package:brig_project/screens/order.dart';
import 'package:flutter/material.dart';
//import 'package:brig_project/screens/cart.dart';
//import 'package:flutter/services.dart';


enum WhichPage { home, checkout, order, subCat, menu }

class BottomBar extends StatelessWidget implements PreferredSizeWidget {
  Color? backgroundColor = Colors.grey[400];
  Color shadowColor = Colors.black;
  Color textColor = Colors.white;
  //String textInput = "testing";
  AppBar appBar;
  WhichPage whichPage = WhichPage.home;
  
  BottomBar(this.appBar, this.whichPage, {super.key});
  
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

      return BottomNavigationBar(
        items: bottomNavigationItems(whichPage),
        currentIndex: selectedIndex, // this is how we use the bottom bar
        backgroundColor: backgroundColor,
        fixedColor: Colors.amber[300], 
        onTap:(value) {
          if (value == 0) {
            print("first item selected");
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const HomePage())
            );
          } else if (value == 2) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => CartPage(cartItems: [
                  CartItem(name: 'Item 1', priceInDollars: 10.0, mealSwipes: 0),
                  CartItem(name: 'Item 2', priceInDollars: 5.0, mealSwipes: 0),
                  CartItem(name: 'Item 3', priceInDollars: 8.0, mealSwipes: 0),
                ],)
              )
            );
          } else if (value == 1) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const OrderPage())
            );
          }
        },
      );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

List<BottomNavigationBarItem> bottomNavigationItems (WhichPage page) {
  if (page == WhichPage.home || page == WhichPage.subCat || page == WhichPage.menu || page == WhichPage.order) {
    return [homeBTN(), menuBTN(), cartBTN()];
  } else if (page == WhichPage.checkout) {
    return [homeBTN(), checkoutBTN(), cartBTN()];
  }
  return [homeBTN()];
}

BottomNavigationBarItem homeBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home', 
  ); 
}

BottomNavigationBarItem menuBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.menu),
    label: 'Menu',
  );
}

BottomNavigationBarItem cartBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Cart',
  );
}

BottomNavigationBarItem checkoutBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.attach_money_rounded),
    label: 'Checkout',
  );
}
