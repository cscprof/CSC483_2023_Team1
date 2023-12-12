class ItemData {

  // Map of menu items
  var menuItems = <Map>[];

  // Add items to map
  ItemData() {
    menuItems.add({
      'title': 'Entrees',
      'image': 'assets/images/burger.png',
    });

    menuItems.add({
      'title': 'Sides',
      'image': 'assets/images/fries.png',
    });

    menuItems.add({
      'title': 'Fruit',
      'image': 'assets/images/apple.png',
    });

    menuItems.add({
      'title': 'Dessert',
      'image': 'assets/images/granola.png',
    });

    menuItems.add({
      'title': 'Drinks',
      'image': 'assets/images/drinks.png',
    });
  }
}