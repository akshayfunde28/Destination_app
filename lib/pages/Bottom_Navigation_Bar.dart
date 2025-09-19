import 'package:flutter/material.dart';
import 'package:turisamapp/pages/Local_service_package/search_page.dart';
import '../Entity_models/item_search_page.dart';
import '../Map_Integration/map_Location.dart';
import '../adharAuth/ProfilePage.dart';
import 'Home_Page.dart';
import 'Local_service_package/Add_Package_Local_Page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIdx = 0;

  final List<Widget> pages = [
    HomePage(),
    PlaceSearchPage(),
    MapSearchScreen(),//NotificationPage(),
    AddPlacePage(),// add page from which local add there package

  ];

  void onTap(int idx) {
    setState(() {
      _selectedIdx = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 👇 IndexedStack keeps all pages alive, only shows selected one
      body: IndexedStack(
        index: _selectedIdx,
        children: pages,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIdx,
        onTap: onTap,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.black87,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.location_pin), label: "Location"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
        ],
      ),
    );
  }
}
