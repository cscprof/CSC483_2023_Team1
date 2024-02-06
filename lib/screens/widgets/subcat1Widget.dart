import 'package:flutter/material.dart';
import '../../firebase/items.dart';

class Subcat1ListView extends StatelessWidget {
  final Future<List<ItemClass>> itemsFuture;
  final String selectedCategory;

  const Subcat1ListView({required this.itemsFuture, required this.selectedCategory, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ItemClass>>(
      future: itemsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for the data
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Handle the case where no data is available
          return Text('No items available for $selectedCategory');
        } else {
          // Display the list of items
          List<ItemClass> items = snapshot.data!;
          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                // NEEDS THE FOLLOWING CHANGES
                // trailing section: isSwipe indicator, add and/or customize button
                // fix layout
                return ListTile(
                  // tileColor: Colors.white,
                  tileColor: const Color(0xfffeffe8),
                  title: Text(items[index].name ?? '', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff2D2D2D)),),
                  subtitle: Row(
                    children: [
                      Text('\$${items[index].price?.toString() ?? ''}', style: const TextStyle(fontSize: 16, color: Color(0xff2D2D2D)),),
                      Icon(isSwipeIcon(items[index].isSwipe),
                        size: 17,
                        color: Color.fromARGB(255, 11, 85, 196)
                      ),
                    ],
                  ), //Text('\$${items[index].price?.toString() ?? ''}', style: const TextStyle(fontSize: 16, color: Color(0xff2D2D2D)),),
                  leading: SizedBox( width: 100, height: 100,
                    child: ClipRRect(borderRadius: BorderRadius.circular(35), //child: Image.asset(items[index].icon ?? '', width: 50, height: 50),
                      child: Image.network(items[index].icon ?? ''),
                      /* for isSwipe indicator
                        if item isSwipe
                          return swipe icon
                        else
                          return non_swipe icon
                      */ 

                    ),
                  ),
                  trailing: TextButton(style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: Colors.grey[400],), onPressed: () {debugPrint("Add button pressed!");}, child: const Text('Add'),),
                  // trailing: ,
                  contentPadding: const EdgeInsets.all(20.0),
                  // onTap: () {
                  //   debugPrint("Item pressed!"); // eventually navigate to subcat2page
                  //   // add to cart on tap
                  //   // function that takes the item input and add to the cart

                  // },
                  shape: const Border(
                    bottom: BorderSide(width: 1, color: Color(0xff2D2D2D)),
                  ),
                );
              },
          );
        }
      },
    );
  }
}

IconData isSwipeIcon (bool isSwipe) {
  if (isSwipe) {
    return Icons.restaurant; //this needs to be smaller
  }
  return Icons.no_meals;
}
