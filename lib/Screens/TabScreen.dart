import 'package:flutter/material.dart';
import 'package:meals_app/Screens/Categories_Screen.dart';
import 'package:meals_app/Screens/Favorites_Screen.dart';

class TabViewsScreen extends StatefulWidget {
  const TabViewsScreen({Key? key}) : super(key: key);

  @override
  _TabViewsScreenState createState() => _TabViewsScreenState();
}

class _TabViewsScreenState extends State<TabViewsScreen> {
  int currentindex = 0;
  List<Widget> screen = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];
  Widget getcategoriessceen(int index) {
    return screen[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Our meals are the best"),
      ),
      drawer: Drawer(
        elevation: 5,
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
              leading: Icon(Icons.no_cell),
              title:
                  Text("Meals", style: Theme.of(context).textTheme.headline3),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/Setting');
              },
              leading: Icon(Icons.ac_unit),
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ],
        ),
      ),
      body: getcategoriessceen(currentindex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => {
          setState(() {
            currentindex = index;
          })
        },
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.white,
        currentIndex: currentindex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade400,
            icon: Icon(Icons.all_inbox),
            label: "ALL",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.grey.shade400,
            icon: Icon(Icons.star_half_rounded),
            label: "Favorite",
          )
        ],
      ),
    );
  }
}
