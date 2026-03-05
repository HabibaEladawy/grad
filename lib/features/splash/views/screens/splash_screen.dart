import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/features/splash/views/widgets/splash_animation_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Center(
        child: SplashAnimationWidget(),
      ),
    );
  }
}
