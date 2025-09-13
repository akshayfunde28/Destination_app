import 'package:flutter/material.dart';
import 'package:turisamapp/pages/Bottom_Navigation_Bar.dart';
import 'package:turisamapp/pages/Home_Page.dart';
import 'package:turisamapp/pages/testpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tourism App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MainPage(), // ✅ your page goes here
    );
  }
}
