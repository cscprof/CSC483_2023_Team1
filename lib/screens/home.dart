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
        appBar: TopAppBar(AppBar(), "Home Page", Colors.yellow, Colors.black),
        body: Stack( // Use a Stack to overlay images
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/backgroundColor.png"), // Background image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 100, // Adjust the position as needed
              left: 50, // Adjust the position as needed
              child: Image.asset(
                "images/tornadoTransparent.png", // First overlay image
                width: 700, // Adjust the width as needed
                height: 700, // Adjust the height as needed
            
              ),
            ),
            Positioned(
              top: 200, // Adjust the position as needed
              left: 150, // Adjust the position as needed
              child: Image.asset(
                "images/wordBrig.png", // Second overlay image
                width: 150, // Adjust the width as needed
                height: 150, // Adjust the height as needed
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to our mobile order page!',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
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
                                    MaterialPageRoute(builder: (context) => SettingsPage()),
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
