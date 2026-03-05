import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/features/Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/chat_app_bar.dart';
import 'package:dana_graduation_project/features/Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/chat_input_bar.dart';
import 'package:dana_graduation_project/features/Chat_with_doctor/presentation/views/screens/Doctor_chat/widgets/doctor_profile_card.dart';
import 'package:flutter/material.dart';


class DoctorChatEmity extends StatelessWidget {
static const String routeName='doctorChat';

  const DoctorChatEmity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg_surface_default_light,
      appBar: const ChatAppBar(
        doctorName: 'د.إسلام غنيم',
        specialty: 'أخصائي علاج طبيعي',
      ),
      body: Column(

        children:  [
          const SizedBox(height: 300),
          Expanded(
              child: DoctorProfileCard()),

          ChatInputBar(),
        ],
      ),
    );
  }
}




