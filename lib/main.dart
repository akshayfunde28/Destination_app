

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turisamapp/pages/Bottom_Navigation_Bar.dart';

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
