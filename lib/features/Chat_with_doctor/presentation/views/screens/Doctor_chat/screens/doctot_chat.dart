import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../data/model/chat_message.dart';


import '../widgets/chat_body.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/doctor_chat_header.dart';


class DoctorChatScreen extends StatefulWidget {
  const DoctorChatScreen({super.key});
  static const String routeName='DoctorChatScreen';

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<ChatMessage> _messages = [
    const ChatMessage(
      text:
      'دكتور، بعد لاحظتني على ابني. في الفترة الأخيرة لاحظت عليه حركات متكررة في الوجه والكتفين. بصراحة فجأة مره في اليوم، وبتكرر مرة في اليوم، بصراحة فجأة مقلقني.',
      isSent: true,
      timestamp: 'تمت قراءته 10:02',
    ),
    const ChatMessage(
      text:
      'شكراً لمشاركتك التفاصيل. مهم أعرف: هل الحركات دي بتحصل بشكل لا إرادي؟ وهل يتزيد ليكون متوتر أو مرهق؟',
      isSent: false,
      timestamp: 'تمت قراءته 10:06',
    ),
    const ChatMessage(
      text:
      'أيه دكتور، بتحصل من غير ما يقصد. وفعلاً لاحظت إنها بتزيد وقت تعبان أو مرهق من الدراسة.',
      isSent: true,
      timestamp: 'تمت قراءته 10:06',
    ),
    const ChatMessage(
      text:
      'واضح إنها قد تكون من نوع الحركات اللاإرادية البسيطة. اللي بنسميها أحياناً حركات نمطية أو حركات عفوية. عادةً بتكون مؤقتة ومرتبطة بالضغط أو التوتر.',
      isSent: false,
      timestamp: 'تمت قراءته 10:07',
    ),
    const ChatMessage(
      text: 'تمام يا دكتور... هل الموضوع محتاج علاج فوراً؟',
      isSent: true,
      timestamp: 'تمت قراءته 10:14',
    ),
    const ChatMessage(
      text:
      'في الغالب نبدأ بتقييم بسيط للتأكد من الوضع. بعدها بسبب آخر بنحدد الخطوات. الأهم في الوقت الحالي إنك تلاحظ التكرار والوقت اللي بتحصل فيه، وهل يؤثر على يومه أو نومه.',
      isSent: false,
      timestamp: 'تمت قراءته 10:18',
    ),
    const ChatMessage(
      text: 'حاضر يا دكتور، هانبدأ معاه وهسجل كل اللاحظات. وهل أحتاج أحجز كشف؟',
      isSent: true,
      timestamp: 'تمت قراءته 10:21',
    ),
    const ChatMessage(
      text:
      'يفضل نعمل زيارة في أقرب وقت علشان أقيم الحالة بشكل كامل. بعد الكشف نقدر نحدد لو الوضع يحتاج متابعة دورية أو مجرد مراقبة.',
      isSent: false,
      timestamp: 'تمت قراءته 10:21',
    ),
  ];

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(
        text: text,
        isSent: true,
        timestamp: 'الآن',
      ));
      _controller.clear();
    });
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: Column(
        children: [
          const DoctorChatHeader(),
          Expanded(
            child: ChatBody(
              messages: _messages,
              scrollController: _scrollController,
            ),
          ),
          ChatInputBar(
            controller: _controller,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}
