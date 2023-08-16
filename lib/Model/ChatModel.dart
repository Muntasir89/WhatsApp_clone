class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String status;
  String currentMessage;
  bool select = false;

  ChatModel(
      {required this.name,
      required this.isGroup,
      required this.currentMessage,
      required this.time,
      required this.icon,
      required this.status,
      required this.select});
}
