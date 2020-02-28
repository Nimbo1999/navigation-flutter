import 'package:flutter/material.dart';

import '../pages/categories_screen.dart';
import '../pages/favorites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Map<String, Object>> _pages = [
    {'page': CategoriesScreen(), 'title': 'Categorias'},
    {'page': FavoritesScreen(), 'title': 'Favoritos'}
  ];
  int _selectedPageIntex = 0;
  void _selectPage(int index){
    setState(() {
      _selectedPageIntex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIntex]['title']),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIntex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          onTap: _selectPage,
          currentIndex: _selectedPageIntex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Categories")
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text("Favorites")
            ),
          ],
        ),
      ),
    );
  }
}