class ReorderData {
  var recentItems = <Map>[];
  var favoriteItems = <Map>[];

  ReorderData() {
    recentItems.add({
      'title': 'Burger',
      'subtitle': '+2 items',
      'datetime': '11/12/23 - 1:00pm',
      'image': 'images/burger.png',
    });

    recentItems.add({
      'title': 'Wrap',
      'subtitle': '+3 items',
      'datetime': '11/10/23 - 12:30pm',
      'image': 'images/wrap.png',
    });

    favoriteItems.add({
      'title': 'Burger',
      'subtitle': '+2 items',
      'image': 'images/burger.png',
    });

    favoriteItems.add({
      'title': 'Wrap',
      'subtitle': '+3 items',
      'image': 'images/wrap.png',
    });
  }
}