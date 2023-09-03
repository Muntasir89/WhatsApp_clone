import 'package:flutter/material.dart';
import 'package:whatsapp_app/NewScreen/CountryPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Enter your phone number",
          style: TextStyle(
              color: Colors.teal,
              fontSize: 17,
              fontWeight: FontWeight.w700,
              wordSpacing: 1),
        ),
        actions: [
          Icon(
            Icons.more_vert,
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(
              "WhatsApp will send an sms message to verify your number",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.5),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "What's my number",
              style: TextStyle(
                color: Colors.cyan[800],
                fontSize: 12.8,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            CountryCard(),
          ],
        ),
      ),
    );
  }

  Widget CountryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => CountryPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
        child: Row(
          children: [
            Expanded(
                child: Container(
              child: Center(
                child: Text(
                  "Bangladesh",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.teal,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
