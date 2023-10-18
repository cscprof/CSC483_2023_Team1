class ItemData {

  // Map of menu items
  var menuItems = <Map>[];

  // Add items to map
  ItemData() {
    menuItems.add({
      'title': 'Entrees',
      'image': 'lib/images/burger.png',
    });

    menuItems.add({
      'title': 'Sides',
      'image': 'lib/images/fries.png',
    });

    menuItems.add({
      'title': 'Fruit',
      'image': 'lib/images/apple.png',
    });

    menuItems.add({
      'title': 'Dessert',
      'image': 'lib/images/granola.png',
    });

    menuItems.add({
      'title': 'Drinks',
      'image': 'lib/images/drinks.png',
    });
  }
}