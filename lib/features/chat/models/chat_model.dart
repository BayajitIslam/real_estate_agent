class ChatModel {
  final String id;
  final String name;
  final String avatar;
  final String lastMessage;
  final String time;
  final bool isOnline;
  final int unreadCount;

  ChatModel({
    required this.id,
    required this.name,
    required this.avatar,
    required this.lastMessage,
    required this.time,
    this.isOnline = false,
    this.unreadCount = 0,
  });
}
