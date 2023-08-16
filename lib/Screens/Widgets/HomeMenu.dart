import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(onSelected: (value) {
      print(value);
    }, itemBuilder: (BuildContext context) {
      return [
        const PopupMenuItem(
          child: Text("New group"),
          value: "New group",
        ),
        const PopupMenuItem(
          child: Text("New broadcast"),
          value: "New broadcast",
        ),
        const PopupMenuItem(
          child: Text("Whatsapp Web"),
          value: "Whatsapp Web",
        ),
        const PopupMenuItem(
          child: Text("Starred messages"),
          value: "Starred messages",
        ),
        const PopupMenuItem(
          child: Text("Settings"),
          value: "Settings",
        ),
      ];
    });
  }
}
