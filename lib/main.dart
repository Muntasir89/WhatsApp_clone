import 'package:flutter/material.dart';
import 'package:whatsapp_app/NewScreen/LandingScreen.dart';
import 'package:whatsapp_app/Screens/HomeScreen.dart';
import 'package:whatsapp_app/Screens/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "OpenSans",
        primaryColor: Color(0xFF075F54),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Color(0xFF128C7E)),
      ),
      home: LoginScreen(),
    );
  }
}
