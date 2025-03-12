import 'package:flutter/material.dart';
import 'pages/auth.dart';
import 'pages/home.dart';
import 'pages/blog.dart';
import 'pages/profile.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      home: HomePage(),
    );
  }
}

