import 'package:flutter/material.dart';
import 'package:brig_project/screens/payment.dart';
import 'widgets/headerbar.dart';
import 'widgets/bottombar.dart';
import 'dart:math';
import '../firebase/users.dart';
import '../firebase/items.dart';



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
    int calculateTotalMealSwipes = currentUser.totalSwipes();

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
                            Text('total modifications: ${totalModifiedItems(currentUser.cart[index].subCategoryItems)}'),//Text('Meal Swipes: ${item.mealSwipes}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('\$${item.price} '),//Text('\$${item.priceInDollars.toStringAsFixed(2)}'),
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
              onPressed: ()                      
              {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const PaymentPage())
                );
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
              style: TextStyle(color: Colors.white),
              // Set the text color to white
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

int totalModifiedItems(List<SubItemClass> subItems) {
  int total = 0;
  for (int i = 0; i < subItems.length; i++) {
    if(subItems[i].isSelected == true) {
      total++;
    }
  }
  return total;
}



