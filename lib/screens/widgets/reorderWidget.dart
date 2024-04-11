import 'package:brig_project/screens/customization.dart';
import 'package:brig_project/firebase/orders.dart';
import 'package:brig_project/firebase/users.dart';
import 'package:brig_project/firebase/items.dart';
import 'package:flutter/material.dart';

class ReorderWidget extends StatelessWidget {
  final List<OrderClass> ordersList;
  
  const ReorderWidget({required this.ordersList, super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //future: ordersList,
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return const CircularProgressIndicator();
        // } else if (snapshot.hasError) {
        //   debugPrint('snapshot has error');
        //   return Text('Error: ${snapshot.error}');
        // } else if (!snapshot.hasData) {
        //   return const Text('No items avaliable in order');
        // } else {
          debugPrint('Making list');
          return Card(
            child: ListView(
              children: <Widget>[
                for (OrderClass order in ordersList) ...[ // maybe a better way to do this?
                // I am just writing this for the sake of time, maybe should make
                // another widget to make this less ugly? 
                  //for (ItemClass item in order.items) ...[
                    ListTile(
                      tileColor: const Color(0xfffeffe8),
                      // title: Text(item['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff2D2D2D)), textAlign: TextAlign.left,),
                      // subtitle: Text(item['subtitle'], style: const TextStyle(), textAlign: TextAlign.center,),
                      title: Column(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    order.orderID,
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2D2D2D)
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '\$${order.totalPrice()}',
                                    style: const TextStyle(),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'Total Items: ${order.items.length}', // make this the icon
                                    style: const TextStyle(),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget> [
                                  Text(
                                    itemsString(order.items),
                                  ),
                                  // ButtonBar(
                                  //   children: <Widget> [
                                  //     TextButton(
                                  //       onPressed: () {
                                  //         debugPrint("Details button pressed!");
                                  //         // display the items under order?? 
                                  //       }, 
                                  //       style: TextButton.styleFrom(foregroundColor: Colors.black,), 
                                  //       child: const Text(
                                  //         'Details',
                                  //         // TODO - should we have the list of items under the details tab?
                                  //         style: TextStyle(decoration: TextDecoration.underline,),
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: TextButton (
                        style: TextButton.styleFrom (
                          foregroundColor: Colors.black,
                          backgroundColor: const Color(0xffCB9700),
                        ), 
                        onPressed: () {
                          debugPrint("Items Added!");
                          currentUser.cart.addAll(order.items);
                        },
                        child: const Text('Add'),
                      ),
                      leading: ClipRRect (
                        borderRadius: BorderRadius.circular(35), 
                        child: order.items[0].icon,//Image.asset(item['image'], width: 50, height: 50),
                      ),
                      contentPadding: const EdgeInsets.all(20.0),
                      shape: const Border(
                        bottom: BorderSide(width: 1, color: Color(0xff2D2D2D)),
                      ),
                      // onLongPress: () {debugPrint("Long pressed!");}
                    ),
                  //],
                ],
              ],
            ),
          );
        }
      //},
    );
  }
}

String itemsString (List<ItemClass> items) {
  String result = '';
  for(int i = 0; i < items.length; i++) {
    result = '$result ${items[i].name} ';
  }
  return result;
}