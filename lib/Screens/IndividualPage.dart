import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_app/Model/ChatModel.dart';
import 'package:whatsapp_app/Model/MessageModel.dart';
import 'package:whatsapp_app/Widgets/HomeMenu.dart';
import 'package:whatsapp_app/Widgets/OwnMessageCard.dart';
import 'package:whatsapp_app/Widgets/ReplyCard.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class IndividualPage extends StatefulWidget {
  const IndividualPage(
      {super.key, required this.chatModel, required this.sourcechat});

  final ChatModel chatModel;
  final ChatModel sourcechat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  //for handling message text changes
  TextEditingController _textController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool show = false;
  FocusNode focusNode = FocusNode();
  late IO.Socket socket;
  bool sendButton = false;

  List<MessageModel> messages = [];

  @override
  void initState() {
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        show = false;
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.0.106:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourcechat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (data) {
        print(data);
        setMessage("destination", data["message"]);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
      });
    });
    socket.onConnectError((data) => print("Connect Error: $data"));
    print(socket.connected);
  }

  void sendMessage(String message, int sourceId, int targetId) {
    setMessage("source", message);
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(message: message, type: type, time: DateTime.now().toString().substring(10,16));
    setState(() {
      setState(() {
        messages.add(messageModel);
      });
    });
  }

  // IO.Socket _socket = IO.io("http://192.168.0.107:3000", IO.OptionBuilder().setTransports(['websocket']).build());

  // _connectionSocket(){
  //   _socket.onConnect((data) => print("Connection established"));
  //   _socket.onConnectError((data) => print("Connect Error: $data"));
  //   _socket.onDisconnect((data) => print("Socket.IO server disconnected"));
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/whatsapp_background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leadingWidth: 70,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(children: [
                  Icon(Icons.arrow_back, size: 24),
                  CircleAvatar(
                    child: SvgPicture.asset(
                      widget.chatModel.isGroup
                          ? "assets/groups.svg"
                          : "assets/person.svg",
                      color: Colors.white,
                      height: 36,
                      width: 36,
                    ),
                    radius: 20,
                    backgroundColor: Colors.blueGrey,
                  )
                ]),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.chatModel.name,
                        style: const TextStyle(
                            fontSize: 18.5, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'last seen today at 12:00',
                        style: TextStyle(fontSize: 13),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
                IconButton(onPressed: () {}, icon: Icon(Icons.call)),
                PopupMenuButton<String>(onSelected: (value) {
                  print(value);
                }, itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      child: Text("View Contact"),
                      value: "View Contact",
                    ),
                    const PopupMenuItem(
                      child: Text("Media, links and docs"),
                      value: "Media, links and docs",
                    ),
                    const PopupMenuItem(
                      child: Text("Whatsapp Web"),
                      value: "Whatsapp Web",
                    ),
                    const PopupMenuItem(
                      child: Text("Search"),
                      value: "Search",
                    ),
                    const PopupMenuItem(
                      child: Text("Mute Notification"),
                      value: "Mute Notification",
                    ),
                    const PopupMenuItem(
                      child: Text("Wallpaper"),
                      value: "Wallpaper",
                    ),
                  ];
                })
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              child: Column(
                children: [
                  Expanded(
                    // height: MediaQuery.of(context).size.height - 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: messages.length+1,
                        itemBuilder: (context, index) {
                          if(index == messages.length){
                            return Container(
                              height: 70,
                            );
                          }
                          if (messages[index].type == "source")
                            return OwnMessageCard(
                                message: messages[index].message,
                                time: messages[index].time
                            );
                          else
                            return ReplyCard(
                                message: messages[index].message,
                                time: messages[index].time
                            );
                        }),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 70,
                    // whole input + emoji picker
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              // Typing (emoji, text), file upload, camera
                              Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                  margin: const EdgeInsets.only(
                                      left: 6, right: 6, bottom: 4),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextFormField(
                                    focusNode: focusNode,
                                    keyboardType: TextInputType.multiline,
                                    textAlignVertical: TextAlignVertical.center,
                                    controller: _textController,
                                    minLines: 1,
                                    maxLines: 5,
                                    onChanged: (value) {
                                      setState(() {
                                        if (value.length > 0)
                                          sendButton = true;
                                        else
                                          sendButton = false;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Type a message",
                                        prefixIcon: IconButton(
                                            onPressed: () {
                                              focusNode.unfocus();
                                              focusNode.canRequestFocus = false;
                                              setState(() {
                                                show = !show;
                                              });
                                            },
                                            icon: Icon(Icons.emoji_emotions)),
                                        suffixIcon: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.attach_file),
                                              // Implementing attach file
                                              onPressed: () {
                                                showModalBottomSheet(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (builder) =>
                                                        bottomSheet());
                                              },
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.camera_alt),
                                              onPressed: () {},
                                            )
                                          ],
                                        ),
                                        contentPadding: EdgeInsets.all(5)),
                                  ),
                                ),
                              ),
                              // Microphone
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 8, right: 5, left: 2),
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Color(0xFF128C7E),
                                  child: IconButton(
                                      onPressed: () {
                                        if (sendButton) {
                                          _scrollController.animateTo(
                                              _scrollController
                                                  .position.maxScrollExtent,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              curve: Curves.easeOut);
                                          sendMessage(
                                              _textController.text,
                                              widget.sourcechat.id,
                                              widget.chatModel.id);
                                          _textController.clear();
                                          setState(() {
                                            sendButton = false;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                          sendButton ? Icons.send : Icons.mic,
                                          color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                          show ? emojiSelect() : Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              onWillPop: () {
                if (show) {
                  setState(() {
                    show = false;
                  });
                } else {
                  Navigator.pop(context);
                }
                return Future.value(false);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, 'Document'),
                  const SizedBox(width: 40),
                  iconCreation(Icons.camera_alt, Colors.pink, 'Camera'),
                  const SizedBox(width: 40),
                  iconCreation(Icons.insert_photo, Colors.purple, 'Gallery'),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, 'Audio'),
                  const SizedBox(width: 40),
                  iconCreation(Icons.location_pin, Colors.teal, 'Location'),
                  const SizedBox(width: 40),
                  iconCreation(Icons.person, Colors.blue, 'Contact'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: EmojiPicker(
        textEditingController: _textController,
        config: const Config(
          columns: 8,
        ),
        onEmojiSelected: (category, Emoji emoji) {
          _textController.text = _textController.text + emoji.emoji;
          setState(() {});
        },
      ),
    );
  }
}
