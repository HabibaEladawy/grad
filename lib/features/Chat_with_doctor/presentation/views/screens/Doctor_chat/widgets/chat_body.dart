import 'package:flutter/material.dart';

import '../../../../../data/model/chat_message.dart';
import 'message_bubble.dart';

class ChatBody extends StatelessWidget {
  final List<ChatMessage> messages;
  final ScrollController scrollController;

  const ChatBody({
    super.key,
    required this.messages,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: messages.length + 1, // +1 for date label
      itemBuilder: (context, index) {
        if (index == 0) return const DateLabel(label: 'Today');
        return MessageBubble(message: messages[index - 1]);
      },
    );
  }
}

class DateLabel extends StatelessWidget {
  final String label;

  const DateLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFFAAAAAA),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}