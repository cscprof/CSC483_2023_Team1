/* ------------------------------------------------------------
  10-12/23
  This code NEEDS to be refactored. Set up for just the home page 
  to be able to navigate whenever its ready. Every currently planned 
  page has a bottom bar for it. Please make this code much more
  clearner to work with in the near future.

-------------------------------------------------------------- */
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
  
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    void onItemTapped(int index) {
      // navigate pages with this
      if (index == 0) {
        print('Home Button Pressed!!!');
      } else if (index == 1) {
        print('Menu Button Pressed!!!');
      } else if (index == 2) {
        print('Cart Button Pressed!!!');
      }
    }
    
    if (whichPage == WhichPage.home || whichPage == WhichPage.order || whichPage == WhichPage.subCat) {
      // assign the home, menu and cart buttons
      return BottomNavigationBar(
        items: [
          homeBTN(), 
          menuBTN(),
          cartBTN(), 
        ],
        currentIndex: selectedIndex, // this is how we use the bottom bar
        backgroundColor: Colors.green[800],
        fixedColor: Colors.grey[400],
        onTap: onItemTapped,
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
      print('Did not find with enum');
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
