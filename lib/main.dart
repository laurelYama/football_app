import 'package:flutter/material.dart';
import 'package:football_app/pages/splash_screen.dart';

void main() { 
  runApp(const MyApp()); 
  }

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(), 
    );
  }
}