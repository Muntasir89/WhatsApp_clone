import 'package:flutter/material.dart';
import 'package:whatsapp_app/Model/ChatModel.dart';
import 'package:whatsapp_app/Widgets/AvatarCard.dart';
import 'package:whatsapp_app/Widgets/ButtonCard.dart';
import 'package:whatsapp_app/Widgets/ContactCard.dart';

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
        select: false,
        id: 1),
    ChatModel(
        name: "Balram",
        isGroup: false,
        currentMessage: "",
        time: "",
        icon: "",
        status: "Developer",
        select: false,
        id: 2),
    ChatModel(
        name: "Saket",
        isGroup: false,
        currentMessage: "",
        time: "",
        icon: "",
        status: "IOS Developer",
        select: false,
        id: 3),
    ChatModel(
        name: "Dev",
        isGroup: false,
        currentMessage: "",
        time: "",
        icon: "",
        status: "Flutter Developer",
        select: false,
        id: 4),
  ];

  List<ChatModel> groupmember = [];

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
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groupmember.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                    onTap: () {
                      setState(() {
                        if (contacts[index - 1].select == false) {
                          contacts[index - 1].select = true;
                          groupmember.add(contacts[index - 1]);
                        } else {
                          contacts[index - 1].select = false;
                          groupmember.remove(contacts[index - 1]);
                        }
                      });
                    },
                    child: ContactCard(contact: contacts[index - 1]));
              }),
          groupmember.length > 0
              ? Container(
                  height: 75,
                  color: Colors.white,
                  child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (context, index) {
                      if (contacts[index].select == true) {
                        return InkWell(
                            onTap: () {
                              groupmember.remove(contacts[index]);
                              contacts[index].select = false;
                            },
                            child: AvatarCard(contact: contacts[index]));
                      } else {
                        return Container();
                      }
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
