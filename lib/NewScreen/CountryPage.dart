import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
        ),
        title: Text(
          "Choose a country",
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              wordSpacing: 1),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.teal,
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
