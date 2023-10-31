import 'package:brig_project/screens/order.dart';
import 'package:flutter/material.dart';
import 'settings.dart'; // Import the Order.dart file
import 'widgets/HeaderBar.dart';
import 'widgets/BottomBar.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Order Page',
      home: Scaffold(
        appBar: TopAppBar(AppBar(), "Home Page"),
        body: Stack( // Use a Stack to overlay images
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/backgroundColor.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width / 3,
              child: Image.asset(
                "images/tornadoTransparent.png",
                width: 400,
                height: 700,
              ),
            ),
            Positioned(
              top: 200,
              left: MediaQuery.of(context).size.width / 5,
              child: Image.asset(
                "images/wordBrig.png",
                width: 700,
                height: 500,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic for the "New Order" button here
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black), // Set the background color to black
                    ),
                    child: const Text('New Order', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 10), // Add some spacing between the buttons
                  ElevatedButton(
                    onPressed: () {
                      // Display a dialog with two buttons: New Order and Reorder
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Order Options'),
                            content: const Text('Choose an option:'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                              
                                  // Add logic for creating a new order here
                                  // Navigate to a new order screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const OrderPage()),
                                  );
                                },
                                child: const Text('New Order'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Close the dialog
                                  Navigator.of(context).pop();
                              
                                  // Add logic for reordering here
                                  // For example, repeat the previous order
                                },
                                child: const Text('Reorder'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Place an Order'),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      ),
    );
  }
}
