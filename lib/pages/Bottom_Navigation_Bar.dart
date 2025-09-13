import 'package:flutter/material.dart';
import 'package:turisamapp/pages/testpage.dart';
import '../Utils/Constants/constants.dart';
import 'Home_Page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIdx = 0;

  final List<Widget> pages = [
    HomePage(),
    HomePage(),
    NotificationPage(),
    HomePage(),// each of these has its own Scaffold + AppBar

  ];

  void onTap(int idx) {
    setState(() {
      _selectedIdx = idx;
      ShowSnakBar(context, "खूप मस्ती रे तुला अजून नाही add केले काही.");
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
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Booking"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: "Profile"),
        ],
      ),
    );
  }
}
