import 'package:flutter/material.dart';
import 'package:whatsapp_app/Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075F54),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF128C7E)),
      ),
      home: const HomeScreen(),
    );
  }
}
