import 'package:flutter/material.dart';
import 'package:whatsapp_app/Model/ChatModel.dart';
import 'package:whatsapp_app/Screens/CreateGroup.dart';
import 'package:whatsapp_app/Screens/Widgets/ButtonCard.dart';
import 'package:whatsapp_app/Screens/Widgets/ContactCard.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Select Contact',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text(
                  '256 contacts',
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search, size: 26),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.call, size: 26),
                onPressed: () {},
              ),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("Invite a new friend"),
                    value: "Invite a new friend",
                  ),
                  const PopupMenuItem(
                    child: Text("Contacts"),
                    value: "Contacts",
                  ),
                  const PopupMenuItem(
                    child: Text("Refresh"),
                    value: "Refresh",
                  ),
                  const PopupMenuItem(
                    child: Text("Help"),
                    value: "Help",
                  ),
                ];
              }),
            ]),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0)
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => CreateGroup()));
                  },
                  child: ButtonCard(
                    icon: Icons.group,
                    name: "New group",
                  ),
                );
              else if (index == 1)
                return ButtonCard(
                  icon: Icons.person_add,
                  name: "New contact",
                );
              return ContactCard(contact: contacts[index - 2]);
            }));
  }
}
