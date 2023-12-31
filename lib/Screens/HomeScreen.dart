import 'package:flutter/material.dart';
import 'package:whatsapp_app/Model/ChatModel.dart';
import 'package:whatsapp_app/Page/CameraPage.dart';
import 'package:whatsapp_app/Page/ChatPage.dart';
import 'package:whatsapp_app/Page/StatusPage.dart';
import 'package:whatsapp_app/Widgets/HomeMenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {super.key, required this.chatModels, required this.sourcechat});
  final List<ChatModel> chatModels;
  final ChatModel sourcechat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            // IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            const HomeMenu(),
          ],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            // isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                icon: Text("CHATS"),
              ),
              Tab(
                icon: Text("STATUS"),
              ),
              Tab(
                icon: Text("CALLS"),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          CameraPage(),
          ChatPage(
            chatModels: widget.chatModels,
            sourcechat: widget.sourcechat,
          ),
          StatusPage(),
          Text('Calls'),
        ]),
      ),
    );
  }
}
