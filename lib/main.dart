import 'package:flutter/material.dart';
import 'package:news_app/spalash_screen.dart';
import 'ui/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spaceflight News App',
      theme: ThemeData.dark().copyWith(
          // Customize dark mode theme if needed
          ),
      home: SplashScreen(), // Set SplashScreen as the initial route
    );
  }
}
