import 'package:flutter/material.dart';
import 'package:whatsapp_app/Model/ChatModel.dart';
import 'package:whatsapp_app/Screens/Widgets/ButtonCard.dart';
import 'package:whatsapp_app/Screens/Widgets/ContactCard.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(
        name: "Monim",
        isGroup: false,
        currentMessage: "",
        time: "",
        icon: "",
        status: "Flutter Developer",
        select: false),
    ChatModel(
        name: "Balram",
        isGroup: false,
        currentMessage: "",
        time: "",
        icon: "",
        status: "Developer",
        select: false),
    ChatModel(
        name: "Saket",
        isGroup: false,
        currentMessage: "",
        time: "",
        icon: "",
        status: "IOS Developer",
        select: false),
    ChatModel(
        name: "Dev",
        isGroup: false,
        currentMessage: "",
        time: "",
        icon: "",
        status: "Flutter Developer",
        select: false),
  ];

  List<ChatModel> groups = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New Group',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text(
                  'add participants',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search, size: 26),
                onPressed: () {},
              ),
            ]),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    setState(() {
                      if (contacts[index].select == false) {
                        contacts[index].select = true;
                        groups.add(contacts[index]);
                      } else {
                        contacts[index].select = false;
                        groups.remove(contacts[index]);
                      }
                    });
                  },
                  child: ContactCard(contact: contacts[index]));
            }));
  }
}
