import 'package:brig_project/screens/cart.dart';
import 'package:brig_project/screens/home.dart';
import 'package:flutter/material.dart';
//import 'package:brig_project/screens/cart.dart';
//import 'package:flutter/services.dart';


enum WhichPage { home, checkout, order, subCat, menu }

// ignore: must_be_immutable
class ReOrder extends StatelessWidget implements PreferredSizeWidget {
    Color? backgroundColor = const Color(0xffCB9700);
  Color shadowColor = Colors.black;
  Color textColor = Colors.white;
  //String textInput = "testing";
  AppBar appBar;
  WhichPage whichPage = WhichPage.home;
  
  ReOrder (this.appBar, this.whichPage, {super.key});
  
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;

      return BottomNavigationBar(
        items: bottomNavigationItems(whichPage),
        currentIndex: selectedIndex, // this is how we use the bottom bar
        backgroundColor: backgroundColor,
        fixedColor: Colors.amber[300], 
        onTap:(value) {
          if (value == 0) {
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
              MaterialPageRoute(builder: (context) => const CartPage(cartItems: [],))
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
    return [homeBTN(),  cartBTN()];
  } else if (page == WhichPage.checkout) {
    return [homeBTN(), cartBTN()];
  }
  return [cartBTN()];
}

BottomNavigationBarItem homeBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home', 
  ); 
}



BottomNavigationBarItem cartBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.shopping_cart),
    label: 'Cart',
  );
}

