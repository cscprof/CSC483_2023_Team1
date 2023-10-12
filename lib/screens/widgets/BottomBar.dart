import 'package:flutter/material.dart';

enum WhichPage { home, checkout, order, subCat, menu }

class BottomBar extends StatelessWidget implements PreferredSizeWidget {
  Color backgroundColor = Colors.purple;
  Color shadowColor = Colors.black;
  Color textColor = Colors.white;
  //String textInput = "testing";
  AppBar appBar;
  WhichPage whichPage = WhichPage.home;
  
  BottomBar(this.appBar, this.whichPage, {super.key});
  
  int index = 0;
  
  @override
  Widget build(BuildContext context) {
    if (whichPage == WhichPage.home || whichPage == WhichPage.order || whichPage == WhichPage.subCat) {
      // assign the home, menu and cart buttons
      return BottomNavigationBar(
        items: [
          homeBTN(), 
          menuBTN(),
          cartBTN(), 
        ],
        //currentIndex: index, // this is how we use the bottom bar
        backgroundColor: backgroundColor,
        fixedColor: Colors.grey[400],
      );
    } else if (whichPage == WhichPage.checkout) {
      // home, checkout buttons
      return BottomNavigationBar(
        items: [
          homeBTN(),
          checkoutBTN(),
        ],   
        backgroundColor: Colors.blue[800],
      );
    } else if (whichPage == WhichPage.menu) {
      // home, cart buttons
      return BottomNavigationBar(
        items:  [
          homeBTN(),
          cartBTN(),
        ],
        backgroundColor: Colors.red[700],
      );
    } else {
      // default, home, menu, cart buttons
      return BottomNavigationBar(
        items:  [
          homeBTN(),
          cartBTN(),
          menuBTN(),
        ],
      );
    }
  }
  
  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}


BottomNavigationBarItem homeBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home', 
  ); 
}

BottomNavigationBarItem menuBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Cart',
  );
}

BottomNavigationBarItem cartBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.menu),
    label: 'Menu',
  );
}

BottomNavigationBarItem checkoutBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.attach_money_rounded),
    label: 'Checkout',
  );
}
