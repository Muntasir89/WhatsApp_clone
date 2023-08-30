import 'package:flutter/material.dart';
import 'package:whatsapp_app/Widgets/StatusPage/HeadOwnStatus.dart';
import 'package:whatsapp_app/Widgets/StatusPage/OthersStatus.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 48,
            child: FloatingActionButton(
              elevation: 8,
              onPressed: () {},
              backgroundColor: Colors.blueGrey[100],
              child: Icon(Icons.edit, color: Colors.blueGrey[900]),
            ),
          ),
          const SizedBox(height: 13),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.greenAccent[700],
            elevation: 5,
            child: Icon(Icons.camera_alt),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeadOwnStatus(),
            label("Recent updates"),
            OthersStatus(
              name: "Rahim",
              imageName: "assets/sagor.png",
              time: "01:27",
            ),
            OthersStatus(
              name: "Surajit",
              imageName: "assets/surajit.png",
              time: "01:59",
            ),
            OthersStatus(
              name: "Mohiuddin",
              imageName: "assets/mohiuddin.png",
              time: "02:30",
            ),
            SizedBox(height: 10),
            label("Viewed updates"),
            OthersStatus(
              name: "Rahim",
              imageName: "assets/sagor.png",
              time: "01:27",
            ),
            OthersStatus(
              name: "Surajit",
              imageName: "assets/surajit.png",
              time: "01:59",
            ),
            OthersStatus(
              name: "Mohiuddin",
              imageName: "assets/mohiuddin.png",
              time: "02:30",
            ),
          ],
        ),
      ),
    );
  }

  Widget label(String labelname) {
    return Container(
      height: 33,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        child: Text(
          labelname,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
