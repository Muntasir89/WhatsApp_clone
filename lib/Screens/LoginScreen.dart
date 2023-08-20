import 'package:flutter/material.dart';
import 'package:whatsapp_app/Model/ChatModel.dart';
import 'package:whatsapp_app/Screens/HomeScreen.dart';
import 'package:whatsapp_app/Widgets/ButtonCard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel source;
  List<ChatModel> chats = [
    ChatModel(
        name: "Monim",
        isGroup: false,
        currentMessage: "Hi! Everyone",
        time: "4:00 PM",
        icon: "person.svg",
        status: '',
        select: false,
        id: 1),
    ChatModel(
        name: "Kishor",
        isGroup: false,
        currentMessage: "Hi! Kishor",
        time: "5:00 PM",
        icon: "person.svg",
        status: '',
        select: false,
        id: 2),
    ChatModel(
        name: "Flutter Developers",
        isGroup: true,
        currentMessage: "Hi! Everyone in this group.",
        time: "5:40 PM",
        icon: "person.svg",
        status: '',
        select: false,
        id: 3),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                source = chats.removeAt(index);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => HomeScreen(chatModels: chats)));
              },
              child: ButtonCard(name: chats[index].name, icon: Icons.person))),
    );
  }
}
