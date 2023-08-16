import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_app/Model/ChatModel.dart';
import 'package:whatsapp_app/Screens/SelectContact.dart';
import 'package:whatsapp_app/Screens/Widgets/CustomCard.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Monim",
        isGroup: false,
        currentMessage: "Hi! Everyone",
        time: "4:00 PM",
        icon: "person.svg",
        status: '',
        select: false),
    ChatModel(
        name: "Kishor",
        isGroup: false,
        currentMessage: "Hi! Kishor",
        time: "5:00 PM",
        icon: "person.svg",
        status: '',
        select: false),
    ChatModel(
        name: "Flutter Developers",
        isGroup: true,
        currentMessage: "Hi! Everyone in this group.",
        time: "5:40 PM",
        icon: "person.svg",
        status: '',
        select: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (builder) => SelectContact()));
          },
          child: const Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => CustomCard(chatModel: chats[index]),
        ));
  }
}
