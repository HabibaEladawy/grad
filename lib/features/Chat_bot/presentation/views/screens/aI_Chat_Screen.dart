import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../providers/app_theme_provider.dart';
import '../../controller/data/model/message_model.dart';
import '../../../../Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/messages_list.dart';
import '../widgets/aI_Chat_AppBar.dart';
import '../widgets/aI_Input_Bar.dart';
import '../widgets/aI_Profile_Card.dart';
import '../widgets/aI_Suggested_Questions.dart';

class AIChatScreen extends StatefulWidget {
  static const String routeName = 'AIChatScreen';
  final Doctor doctor;

  const AIChatScreen({super.key, required this.doctor});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final List<Message> _messages = [];
  bool _chatStarted = false;



  List<String> get _suggestedQuestions => [
    AppLocalizations.of(context)!.suggestedQ1,
    AppLocalizations.of(context)!.suggestedQ2,
    AppLocalizations.of(context)!.suggestedQ3,
    AppLocalizations.of(context)!.suggestedQ4,
    AppLocalizations.of(context)!.suggestedQ5,
  ];

  void _handleSend(String text) {
    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      sender: MessageSender.user,
      time: _formatTime(DateTime.now()),
      isRead: false,
    );
    setState(() {
      if (!_chatStarted) {
        _messages.addAll(getSampleMessages(context));
      }
      _chatStarted = true;
      _messages.add(newMessage);
    });
  }

  String _formatTime(DateTime dt) {
    final h = dt.hour.toString().padLeft(2, '0');
    final m = dt.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final locale = Localizations.localeOf(context).languageCode;
    final isRtl = locale == 'ar';

    return Directionality(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: isDark
            ? AppColors.bg_surface_subtle_dark
            : AppColors.bg_surface_subtle_light,
        appBar: AIChatAppBar(),
        body: Column(
          children: [
            Expanded(
              child: _chatStarted
                  ? MessagesList(
                doctor: widget.doctor,
                messages: _messages,
                showAvatar: true,
              )
                  : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200.h),
                    const AIProfileCard(),
                    SizedBox(height: 32.h),
                    AISuggestedQuestions(
                      questions: _suggestedQuestions,
                      onQuestionTap: _handleSend,
                    ),
                  ],
                ),
              ),
            ),
            AIInputBar(onSend: _handleSend),
          ],
        ),
      ),
    );
  }
}