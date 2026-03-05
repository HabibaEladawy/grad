import 'package:flutter/material.dart';

import '../../../../../data/model/chat_message.dart';


class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isSent = message.isSent;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment:
        isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          _BubbleBox(message: message),
          const SizedBox(height: 4),
          _Timestamp(timestamp: message.timestamp, isSent: isSent),
        ],
      ),
    );
  }
}

class _BubbleBox extends StatelessWidget {
  final ChatMessage message;

  const _BubbleBox({required this.message});

  @override
  Widget build(BuildContext context) {
    final isSent = message.isSent;

    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.72,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: isSent ? const Color(0xFF4A90D9) : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(18),
          topRight: const Radius.circular(18),
          bottomLeft:
          isSent ? const Radius.circular(18) : const Radius.circular(4),
          bottomRight:
          isSent ? const Radius.circular(4) : const Radius.circular(18),
        ),
        boxShadow: isSent
            ? null
            : [
          const BoxShadow(
            color: Color(0x14000000),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        message.text,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          fontSize: 13.5,
          height: 1.6,
          color: isSent ? Colors.white : const Color(0xFF222222),
        ),
      ),
    );
  }
}

class _Timestamp extends StatelessWidget {
  final String timestamp;
  final bool isSent;

  const _Timestamp({required this.timestamp, required this.isSent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        timestamp,
        style: TextStyle(
          fontSize: 10,
          color: isSent ? const Color(0xFF90B8E0) : const Color(0xFFBBBBBB),
        ),
      ),
    );
  }
}