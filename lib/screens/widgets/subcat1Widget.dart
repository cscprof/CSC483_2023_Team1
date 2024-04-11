import 'package:brig_project/screens/customization.dart';
import 'package:flutter/material.dart';
import '../../firebase/items.dart';
import '../../firebase/users.dart';

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
                return ListTile(
                  tileColor: const Color(0xfffeffe8),
                  title: Text(items[index].name, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff2D2D2D)),),
                  subtitle: Row(
                    children: [
                      Text('\$${items[index].price.toString()}', style: const TextStyle(fontSize: 16, color: Color(0xff2D2D2D)),),
                      Icon(isSwipeIcon(items[index].isSwipe),
                        size: 17,
                        // color: const Color.fromARGB(255, 11, 85, 196)
                        color: items[index].isSwipe ? const Color.fromARGB(255, 11, 85, 196) : Colors.red,
                      ),
                    ],
                  ), 
                  leading: SizedBox(width: 75, height: 75,
                    child: ClipRRect(borderRadius: BorderRadius.circular(35), 
                      child: items[index].icon,
                  ),
                  ),
                  trailing: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: const Color(0xffCB9700)
                    ), 
                    onPressed: () {
                      debugPrint("Add button pressed!");

                      if (items[index].subCategoryItems.isNotEmpty) { // maybe turn this inot a button? 
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CustomizationPage(selectedItem: items[index]),
                      ));
                      } else {
                        debugPrint('Does not have customizations!! Adding ${items[index].name} to cart.');
                        currentUser.cart.add(items[index]);
                      }
                    },
                    child: const Text('Add'),
                  ),
                  contentPadding: const EdgeInsets.all(20.0),
                  shape: Border(
                    top: index == 0 ? const BorderSide(width: 1, color: Color(0xff2D2D2D)) : BorderSide.none,
                    bottom: const BorderSide(width: 1, color: Color(0xff2D2D2D)),
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
