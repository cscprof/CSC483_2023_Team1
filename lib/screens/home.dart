// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
//import 'settings.dart'; // Import the Order.dart file
import 'widgets/headerbar.dart';
import 'widgets/bottombar.dart';
import 'order.dart';
import 'reorder.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Order Page',
      home: Scaffold(
        appBar: TopAppBar(AppBar(), "Home Page"),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/backgroundColor.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width / 13,
              child: Image.asset(
                "assets/images/tornadoTransparent.png",
                width: 400,
                height: 700,
              ),
            ),
            Positioned(
              top: 200,
              left: MediaQuery.of(context).size.width / 4.5,
              child: Image.asset(
                "assets/images/wordBrig.png",
                width: 500,
                height: 300,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const OrderPage())
                     );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all( const Color(0xffCB9700)), // Set the background color to black
                    ),
                    child: const Text('New Order', style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(height: 10), // Add some spacing between the buttons
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (context) => const ReorderPage())
                     );
                    },
                    style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.all( const Color(0xffCB9700)), // Set the background color to black
                    ),
                    child: const Text('Re Order', style: TextStyle(color: Colors.white)),
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
