import 'package:flutter/material.dart';
import 'package:brig_project/screens/payment.dart';
import 'widgets/headerbar.dart';
import 'widgets/cartbottom.dart';
import 'dart:math';
import '../firebase/users.dart';
import '../firebase/items.dart';
import '../firebase/orders.dart';


class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  // ignore: library_private_types_in_public_api
  _CartPageState createState() => _CartPageState();
}
 
class CartItem {
  final String name;
  final double priceInDollars;
  final int mealSwipes; // New property for meal swipes

  CartItem({required this.name, required this.priceInDollars, required this.mealSwipes});
}
/* List<ItemClass> OrdertoCart=[]; */

class _CartPageState extends State<CartPage> {
   

  String calculateEstimatedTime() {
      // Assuming a base time for each item and a random factor for variety
      int baseTimePerItem = 1; // in minutes
      int randomFactor = Random().nextInt(10); // Random factor between 0 and 10 minutes

      int totalItems = currentUser.cart.length;
      int estimatedTime = totalItems * baseTimePerItem + randomFactor;

      return estimatedTime.toString();
  }

// Function to remove an item from the cart
  void removeItem(int index) {
    currentUser.cart.removeAt(index);
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    double total = currentUser.totalPrice();
    int calculateTotalMealSwipes = currentUser.totalSwipes;
    //List<ItemClass> swipeItemSelected = [];

    // Calculate the total price of items in the cart
    // for (var item in widget.cartItems) {
    //   total += item.priceInDollars;
    //  }
// calculate for meal swipes
    // for (var item in widget.cartItems) {
    //   calculateTotalMealSwipes += item.mealSwipes;
    // }
    
  return MaterialApp(
  home: Scaffold(
    backgroundColor: const Color(0xffFEFFD8),
    appBar: TopAppBar(AppBar(), "Cart"),
    body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: currentUser.cart.length,
            itemBuilder: (context, index) {
              final item = currentUser.cart[index];
              
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color(0xffCB9700),
                      ),
                    ),
                    child: ListTile(
                      title: Text(item.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('total modifications: ${totalModifiedItems(currentUser.cart[index].subCategoryItems)}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [    
                          Text('\$${item.price} '),
                          Checkbox(
                            // tristate: false,
                            // fillColor: MaterialStateProperty.resolveWith((selected) {
                            //   if (selected.contains(MaterialState.pressed)) {
                                
                            //   }
                            //   return const Color(0xffCB9700);
                            // }),
                            value: currentUser.cart[index].swipeSelectect,
                            onChanged: (bool? value) {
                              // if(value == true) {
                              //   // add to list
                              //   debugPrint("adding ${currentUser.cart[index].name}");
                              //   swipeItemSelected.add(currentUser.cart[index]);
                              // } else {
                              //   // remove item from list
                              //   swipeItemSelected.remove(currentUser.cart[index]);
                              //   debugPrint("removing ${currentUser.cart[index].name}");
                              // }
                              setState(() {
                                currentUser.cart[index].swipeSelectect = value!;
                                debugPrint('current value for ${currentUser.cart[index].name} : ${currentUser.cart[index].swipeSelectect}');
                              }); 
                            },
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton(
                            onPressed: () {
                              // Call the removeItem function when the button is pressed
                              removeItem(index);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red, // Set the background color to red
                            ),
                            child: const Text('Remove'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total in Flex: \$${total.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: Text(
            //     'Total Meal Swipes: \$${calculateTotalMealSwipes.toStringAsFixed(2)}',
            //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Your Order will take around: ${calculateEstimatedTime()} minutes',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {                      
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => const PaymentPage())
              );
              OrderClass order = OrderClass("1101", currentUser.name, false);
              debugPrint('----Calculating Swipes----');
              for (int i = 0; i < currentUser.cart.length; i++) {
                if (currentUser.cart[i].swipeSelectect) {
                  order.addItemToSwipe(currentUser.cart[i]);
                }
              }  
              currentUser.totalSwipes = order.swipeItemSelected.length;  
              debugPrint('Total Swipes : ${currentUser.totalSwipes}');     
              // Implement the functionality to proceed to checkout
              // You can navigate to a checkout page or perform any other action
              // based on the items in the cart.
              // For simplicity, let's just print a message for now.
              //print('Proceed to Checkout');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor : const Color(0xffCB9700)// Set the background color to black
            ),
            child: const Text(
              'Proceed to Checkout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
    bottomNavigationBar: CartBottomBar(AppBar(), WhichPage.home),
  ),
);

  }
}

int totalModifiedItems(List<SubItemClass> subItems) {
  int total = 0;
  for (int i = 0; i < subItems.length; i++) {
    if(subItems[i].isSelected == true) {
      total++;
    }
  }
  return total;
}