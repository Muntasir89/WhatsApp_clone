import 'package:flutter/material.dart';
import 'package:whatsapp_app/Model/CountryModel.dart';
import 'package:whatsapp_app/NewScreen/CountryPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String countryname = "Bangladesh";
  String countrycode = "+880";
  TextEditingController _controller = TextEditingController();
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
            countryCard(),
            SizedBox(
              height: 15,
            ),
            number(),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                if (_controller.text.length < 10) {
                  showNoNumberDialog();
                } else {
                  showMyDialog();
                }
              },
              child: Container(
                height: 40,
                width: 70,
                color: Colors.tealAccent[400],
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => CountryPage(
                      setCountryData: setCountryData,
                    )));
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
                  countryname,
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

  Widget number() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      padding: EdgeInsets.symmetric(vertical: 5),
      height: 38,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("+"),
                SizedBox(width: 15),
                Text(
                  countrycode.substring(1),
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          SizedBox(width: 30),
          Container(
            width: MediaQuery.of(context).size.width / 1.5 - 100,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.teal, width: 1.8),
              ),
            ),
            child: TextFormField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Phone number"),
            ),
          )
        ],
      ),
    );
  }

  void setCountryData(CountryModel country) {
    setState(() {
      countryname = country.name;
      countrycode = country.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMyDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "We will be verifying your phone number",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    countrycode + " " + _controller.text,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Is this Ok or would you like to edit the number?",
                    style: TextStyle(fontSize: 13.5),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Edit")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }

  Future<void> showNoNumberDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Text(
                "There is no number you entered",
                style: TextStyle(fontSize: 14),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }
}
