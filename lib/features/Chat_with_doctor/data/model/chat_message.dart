// models/message_model.dart
class ChatMessage {
  final String text;
  final bool isSent;
  final String timestamp;

  const ChatMessage({
    required this.text,
    required this.isSent,
    required this.timestamp,
  });
}