import 'package:flutter/material.dart';
import 'user_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        primaryColor: Color(0xFF0A0E21),
        primaryTextTheme: TextTheme(
          title: TextStyle(
            color: Color(0xFFfffdd0),
          ),
        ),
        textTheme: TextTheme(
          body1: TextStyle(
            color: Color(0xFFfffdd0),
          ),
          body2: TextStyle(
            color: Color(0xFFfffdd0),
          ),
        ),
      ),
      home: UserPage(),
    );
  }
}
