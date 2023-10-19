class ItemData {

  // Map of menu items
  var menuItems = <Map>[];

  // Add items to map
  ItemData() {
    menuItems.add({
      'title': 'Entrees',
      'image': 'images/burger.png',
    });

    menuItems.add({
      'title': 'Sides',
      'image': 'images/fries.png',
    });

    menuItems.add({
      'title': 'Fruit',
      'image': 'images/apple.png',
    });

    menuItems.add({
      'title': 'Dessert',
      'image': 'images/granola.png',
    });

    menuItems.add({
      'title': 'Drinks',
      'image': 'images/drinks.png',
    });
  }
}