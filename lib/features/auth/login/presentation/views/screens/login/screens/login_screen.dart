
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/widgets/login_body.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static String routeName = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 34.5, right: 24, left: 24),
        child: LoginBody(),
      ),
    );
  }
}