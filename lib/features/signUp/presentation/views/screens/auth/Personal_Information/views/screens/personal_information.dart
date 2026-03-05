
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/Personal_Information/views/widgets/personal_information_body.dart';

import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  static const String routeName = 'PersonalInformation';
  final VoidCallback? onNext;

  const PersonalInformation({super.key, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersonalInformationBody(onNext: onNext),
      ),
    );
  }
}