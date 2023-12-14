import 'package:flutter/material.dart';
//import 'settings.dart'; // Import the Order.dart file
import 'widgets/HeaderBar.dart';
import 'widgets/BottomBar.dart';
import 'dart:math';



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

class _CartPageState extends State<CartPage> {

String calculateEstimatedTime() {
    // Assuming a base time for each item and a random factor for variety
    int baseTimePerItem = 1; // in minutes
    int randomFactor = Random().nextInt(10); // Random factor between 0 and 10 minutes

    int totalItems = widget.cartItems.length;
    int estimatedTime = totalItems * baseTimePerItem + randomFactor;

    return estimatedTime.toString();
  }

// Function to remove an item from the cart
  void removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    double total = 0;
    double calculateTotalMealSwipes = 0;

    // Calculate the total price of items in the cart
    widget.cartItems.forEach((item) {
      total += item.priceInDollars;
     });
// calculate for meal swipes
widget.cartItems.forEach((item) {
  calculateTotalMealSwipes += item.mealSwipes;
});

    return MaterialApp(
  home: Scaffold(
    backgroundColor: const Color(0xffFEFFD8),
    appBar: TopAppBar(AppBar(), "Cart"),
    body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.cartItems.length,
            itemBuilder: (context, index) {
              final item = widget.cartItems[index];
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
                          Text('Meal Swipes: ${item.mealSwipes}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('\$${item.priceInDollars.toStringAsFixed(2)}'),
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
            'Total in Dollars & Flex: \$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Total Meal Swipes: \$${calculateTotalMealSwipes.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

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
      // Implement the functionality to proceed to checkout
      // You can navigate to a checkout page or perform any other action
      // based on the items in the cart.
      // For simplicity, let's just print a message for now.
      //print('Proceed to Checkout');
                },
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black, // Set the background color to black
          ),
            child: const Text('Proceed to Checkout',
            style: TextStyle(color: Colors.white), // Set the text color to white
            ),
          ),
        ),

      ],
    ),
    bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
  ),
);

  }
}

//void main() {
//   runApp(MaterialApp(
//     home: CartPage(
//       cartItems: [
//         CartItem(name: 'Item 1', quantity: 2, price: 10.0),
//         CartItem(name: 'Item 2', quantity: 1, price: 5.0),
//         CartItem(name: 'Item 3', quantity: 3, price: 8.0),
//       ],
//     ),
//   ));
// }

//
//  run your page
//  get information by calling one of my functions
//     - async : sit in idle and wait till information is gathered
//     - ryan will return the information to you when its all gathered
//  you will do what you want with the informaion using JSON filing stuff


