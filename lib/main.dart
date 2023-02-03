import 'package:flutter/material.dart';
import 'home_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Calci(),
      debugShowCheckedModeBanner: false,
    );
  }
}

