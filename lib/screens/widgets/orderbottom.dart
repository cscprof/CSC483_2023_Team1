import 'package:brig_project/screens/cart.dart';
import 'package:brig_project/screens/home.dart';
import 'package:brig_project/screens/order.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:brig_project/firebase/users.dart';
//import 'package:brig_project/screens/cart.dart';
//import 'package:flutter/services.dart';


enum WhichPage { home, checkout, order, subCat, menu }

// ignore: must_be_immutable
class OrderBottomBar extends StatelessWidget implements PreferredSizeWidget {
    Color? backgroundColor = const Color(0xffCB9700);
  Color shadowColor = Colors.black;
  Color textColor = Colors.white;
  //String textInput = "testing";
  AppBar appBar;
  WhichPage whichPage = WhichPage.home;
  
  OrderBottomBar(this.appBar, this.whichPage, {super.key});
  
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
  return [menuBTN()];
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
  debugPrint('using orderbottom bar - cart size ${currentUser.cart.length}');
  return BottomNavigationBarItem(
     icon: Stack(
      children: [
        const Icon(Icons.shopping_cart),
        if (currentUser.cart.isNotEmpty)
          Positioned(
            right: 0,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                currentUser.cart.length.toString(),
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
         ),
      ],
    ),
    // icon: Stack(
    //   children: [
    //     const Icon(Icons.shopping_cart),
    //     ValueListenableBuilder(
    //       valueListenable: currentUser.cart.length as ValueListenable, 
    //       builder: (context, value, widget) {
    //         return Positioned(
    //           right: 0,
    //           child: CircleAvatar(
    //             radius: 8,
    //             backgroundColor: Colors.red,
    //             child: Text(
    //               currentUser.cart.length.toString(),
    //               style: const TextStyle(fontSize: 10, color: Colors.white),
    //             ),
    //           ),
    //         );
    //       }          
    //     )
    //   ],
    // ),
    label: 'Cart',
  );
}

BottomNavigationBarItem checkoutBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.attach_money_rounded),
    label: 'Checkout',
  );
}
