class ReorderData {
  var recentItems = <Map>[];
  var favoriteItems = <Map>[];

  ReorderData() {
    recentItems.add({
      'title': 'Burger',
      'subtitle': '+2 items',
      'datetime': '11/12/23 - 1:00pm',
      'image': 'assets/images/burger.png',
    });

    recentItems.add({
      'title': 'Wrap',
      'subtitle': '+3 items',
      'datetime': '11/10/23 - 12:30pm',
      'image': 'assets/images/wrap.png',
    });

    favoriteItems.add({
      'title': 'Burger',
      'subtitle': '+2 items',
      'image': 'assets/images/burger.png',
    });

    favoriteItems.add({
      'title': 'Wrap',
      'subtitle': '+3 items',
      'image': 'assets/images/wrap.png',
    });
  }
}