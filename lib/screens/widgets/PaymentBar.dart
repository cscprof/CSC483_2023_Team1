// ignore_for_file: must_be_immutable

//import 'package:brig_project/firebase/orders.dart';
import 'package:brig_project/firebase/users.dart';
import 'package:brig_project/screens/cart.dart';
import 'package:brig_project/screens/confirm.dart';
import 'package:brig_project/screens/home.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';\


enum WhichPage { home, checkout, order, subCat, menu }

class PaymentBar extends StatelessWidget implements PreferredSizeWidget {
   Color? backgroundColor = const Color(0xffCB9700);
  Color shadowColor = Colors.black;
  Color textColor = Colors.white;
  //String textInput = "testing";
  AppBar appBar;
  WhichPage whichPage = WhichPage.home;
  
  PaymentBar(this.appBar, this.whichPage, {super.key});
  
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;

      return BottomNavigationBar(
        items: bottomNavigationItems(whichPage),
        currentIndex: selectedIndex, // this is how we use the bottom bar
        backgroundColor: backgroundColor,
        fixedColor: Colors.grey[300], 
        onTap:(value) {
          if (value == 0) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const CartPage(cartItems: [],))
            );
          } else if (value == 2) {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const HomePage())
            );
          } else if (value == 1) {
            // add order to firebase here
            currentUser.uploadCurrentOrder();
            currentUser.updateFlex(currentUser.totalPrice()); 
            //currentUser.updateSwipes(currentUser.order.swipeItemSelected.length); // maybe should make this better lol
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const ConfirmPage())
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
    return [homeBTN(), cartBTN()];
  }
  return [homeBTN()];
}

BottomNavigationBarItem cartBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home', 
  ); 
}

BottomNavigationBarItem menuBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.monetization_on_rounded),
    label: 'Submit Order',
  );
}

BottomNavigationBarItem homeBTN () {
  return const BottomNavigationBarItem(
    icon: Icon(Icons.arrow_back),
    label: 'Return to Cart',
  );
}


