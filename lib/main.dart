import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeBottomNavigationBarPage());
  }
}
