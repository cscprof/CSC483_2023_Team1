// ignore_for_file: library_private_types_in_public_api, unused_local_variable

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
  _CartPageState createState() => _CartPageState();
}
 
class CartItem {
  final String name;
  final double priceInDollars;
  final int mealSwipes; // New property for meal swipes

  CartItem({required this.name, required this.priceInDollars, required this.mealSwipes});
}

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
    setState(() {
      currentUser.cart.removeAt(index);
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = currentUser.totalPrice();
    int calculateTotalMealSwipes = currentUser.totalSwipes;

    return MaterialApp(
    home: Scaffold(
      backgroundColor: const Color.fromARGB(255, 179, 179, 179),
      appBar: TopAppBar(AppBar(), "Cart"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: currentUser.cart.length,
              itemBuilder: (context, index) {
                final item = currentUser.cart[index];//widget.cartItems[index];
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: const Color(0xff2D2D2D),
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
                            Text('\$${item.price} '),//Text('\$${item.priceInDollars.toStringAsFixed(2)}'),
                            const SizedBox(width: 16),
                            Checkbox(
                              value: currentUser.cart[index].swipeSelectect,
                              onChanged: (bool? value) {
                                setState(() {
                                  currentUser.cart[index].swipeSelectect = value!;
                                  debugPrint('current value for ${currentUser.cart[index].name} : ${currentUser.cart[index].swipeSelectect}');
                                }); 
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Remove Item"),
                                        content: const Text("Are you sure you want to remove this item from cart?"),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              // Call the removeItem function when "Yes" is pressed
                                              removeItem(index);
                                              Navigator.of(context).pop(); // Close the alert dialog
                                            },
                                            child: const Text("Yes"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop(); // Close the alert dialog
                                            },
                                            child: const Text("No"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
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
              onPressed: ()                      
              {
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
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Set the background color to black
              ),
              child: const Text('Proceed to Checkout',
                style: TextStyle(color: Colors.white),
              // Set the text color to white
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