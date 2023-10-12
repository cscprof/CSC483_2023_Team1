import 'package:flutter/material.dart';
import 'login.dart'; // Import the Order.dart file
import 'widgets/HeaderBar.dart';
import 'widgets/BottomBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Order Page',
      home: Scaffold(
        appBar: TopAppBar(AppBar(), "Home Page", Colors.yellow, Colors.black),
        body: Center(
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
                                MaterialPageRoute(builder: (context) => LoginPage()),
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
        bottomNavigationBar: BottomBar(AppBar(), WhichPage.home),
      ),
    );
  }
}
