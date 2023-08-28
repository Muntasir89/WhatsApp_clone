import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_app/Model/ChatModel.dart';
import 'package:whatsapp_app/Screens/SelectContact.dart';
import 'package:whatsapp_app/Widgets/CustomCard.dart';

class ChatPage extends StatefulWidget {
  const ChatPage(
      {super.key, required this.chatModels, required this.sourcechat});
  final List<ChatModel> chatModels;
  final ChatModel sourcechat;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
          itemCount: widget.chatModels.length,
          itemBuilder: (context, index) => CustomCard(
            chatModel: widget.chatModels[index],
            sourcechat: widget.sourcechat,
          ),
        ));
  }
}
