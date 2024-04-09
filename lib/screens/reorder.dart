import 'package:flutter/material.dart';
import 'widgets/headerbar.dart';
 import 'widgets/reorderbottom.dart';
// import '../data/itemdata.dart';
import 'package:brig_project/themes/theme_data.dart';
import '../data/reorderdata.dart';


ReorderData item = ReorderData();

class ReorderPage extends StatelessWidget {
  const ReorderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: ReorderScreen());
  }
}

class ReorderScreen extends StatelessWidget {
  const ReorderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Reorder Page",
      home: Scaffold(
         appBar: TopAppBar(AppBar(), 'Reorder Page'),
        body: const ReorderTabBar(),
        backgroundColor:  const Color(0xffFEFFD4),
        bottomNavigationBar: ReOrder(AppBar(), WhichPage.menu),
      ),
      theme: MyThemeData.baseTheme,
    );
  }
}

class ReorderTabBar extends StatelessWidget {
  const ReorderTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
         backgroundColor:  const Color(0xffFEFFD4),
        appBar: AppBar(
          bottom: TabBar(
            labelColor: Colors.black, // selected text color
            unselectedLabelColor: Colors.grey[400],
            tabs: const <Widget>[
              Tab(
                text: 'Recents',
              ),
              Tab(
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // recents
            Card(
              child: ListView(
                children: <Widget>[
                  for (var item in item.recentItems) ...[
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
                              Text(item['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff2D2D2D)), textAlign: TextAlign.left,),
                            ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(item['subtitle'], style: const TextStyle(), textAlign: TextAlign.left,),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(item['datetime'], style: const TextStyle(), textAlign: TextAlign.left,),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                ButtonBar(
                                  children: <Widget>[
                                    TextButton(onPressed: () {debugPrint("Details button pressed!");}, style: TextButton.styleFrom(foregroundColor: Colors.black,), child: const Text('Details', style: TextStyle(decoration: TextDecoration.underline,),),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: TextButton(style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor: const Color(0xffCB9700),), onPressed: () {debugPrint("Add button pressed!");}, child: const Text('Add'),),
                    leading: ClipRRect(borderRadius: BorderRadius.circular(35), child: Image.asset(item['image'], width: 50, height: 50),),
                    contentPadding: const EdgeInsets.all(20.0),
                    shape: const Border(
                      bottom: BorderSide(width: 1, color: Color(0xff2D2D2D)),
                    ),
                    // onLongPress: () {debugPrint("Long pressed!");}
                    ),
                  ],
              ],
              ),
            ),

            // favorites
            Card(
              child: ListView(
                children: <Widget>[
                  for (var item in item.favoriteItems) ...[
                  ListTile(
                    tileColor: const Color(0xfffeffe8),
                    // title: Text(item['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff2D2D2D)), textAlign: TextAlign.center,),
                    // subtitle: Text(item['subtitle'], style: const TextStyle(), textAlign: TextAlign.center,),
                    title: Column(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                            children: <Widget>[
                              Text(item['title'], style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xff2D2D2D)), textAlign: TextAlign.left,),
                            ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(item['subtitle'], style: const TextStyle(), textAlign: TextAlign.left,),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                ButtonBar(
                                  alignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    TextButton(onPressed: () {debugPrint("Details button pressed!");}, style: TextButton.styleFrom(foregroundColor: Colors.black,), child: const Text('Details', style: TextStyle(decoration: TextDecoration.underline,),),),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: TextButton(style: TextButton.styleFrom(foregroundColor: Colors.black, backgroundColor:  const Color(0xffCB9700),), onPressed: () {debugPrint("Add button pressed!");}, child: const Text('Add'),),
                    leading: ClipRRect(borderRadius: BorderRadius.circular(35), child: Image.asset(item['image'], width: 50, height: 50),),
                    contentPadding: const EdgeInsets.all(20.0),
                    shape: const Border(
                      bottom: BorderSide(width: 1, color: Color(0xff2D2D2D)),
                    ),
                    // onLongPress: () {debugPrint("Long pressed!");}
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}