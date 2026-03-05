
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/Personal_Information/views/screens/personal_information.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/add_children/views/screens/child_info_screen.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/create_password/views/screens/create_password_screen.dart';
import 'package:flutter/material.dart';

class SignUpPageView extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onPageChanged;
  final VoidCallback onNext;

  const SignUpPageView({
    super.key,
    required this.controller,
    required this.onPageChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: [
          PersonalInformation(onNext: onNext),
          ChildInfoScreen(onNext: onNext),
          CreatePasswordScreen(),
        ],
      ),
    );
  }
}
