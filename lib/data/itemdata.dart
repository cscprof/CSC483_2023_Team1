class ItemData {

  // Map of menu items
  var menuItems = <Map>[];

  // Add items to map
  ItemData() {
    menuItems.add({
      'title': 'Entrees',
      'image': 'assets/images/burger.png',
      'selectedCategory': 'entree',
    });

    menuItems.add({
      'title': 'Sides',
      'image': 'assets/images/fries.png',
      'selectedCategory': 'side',
    });

    menuItems.add({
      'title': 'Fruit',
      'image': 'assets/images/apple.png',
      'selectedCategory': 'fruit',
    });

    menuItems.add({
      'title': 'Dessert',
      'image': 'assets/images/granola.png',
      'selectedCategory': 'dessert',
    });

    menuItems.add({
      'title': 'Drinks',
      'image': 'assets/images/drinks.png',
      'selectedCategory': 'drink',
    });
  }
}