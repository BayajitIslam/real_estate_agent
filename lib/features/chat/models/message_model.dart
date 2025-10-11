
class MessageModel {
  final String id;
  final String text;
  final bool isSentByMe;
  final String time;

  MessageModel({
    required this.id,
    required this.text,
    required this.isSentByMe,
    required this.time,
  });
}
