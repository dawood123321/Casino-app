import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/aviator_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casino App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF1A1A2E),
        primaryColor: Colors.purple,
      ),
      home: HomeScreen(),
      routes: {
        '/aviator': (ctx) => AviatorScreen(),
      },
    );
  }
}
