
import 'package:dana_graduation_project/core/utils/app_assets.dart';
import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:flutter/material.dart';

class SplashAnimationWidget extends StatefulWidget {
  const SplashAnimationWidget({super.key});

  @override
  State<SplashAnimationWidget> createState() => _SplashAnimationWidgetState();
}

class _SplashAnimationWidgetState extends State<SplashAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  /// أنيميشن للقلب الكامل
  late Animation<Offset> _heartSlide;

  /// أنيميشن للنقطتين
  late Animation<Offset> _dot1Slide;
  late Animation<Offset> _dot2Slide;

  /// أنيميشن لأيقونة دانا من اليمين
  late Animation<Offset> _danaSlide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    /// القلب يجي من الشمال
    _heartSlide = Tween<Offset>(
      begin: const Offset(-3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    /// النقطة الأولى تيجي من فوق شمال
    _dot1Slide = Tween<Offset>(
      begin: const Offset(-3, -3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    /// النقطة الثانية تيجي من فوق شمال (أقرب للوسط)
    _dot2Slide = Tween<Offset>(
      begin: const Offset(-1.5, -3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    /// كلمة دانا تيجي من اليمين
    _danaSlide = Tween<Offset>(
      begin: const Offset(3, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    /// شاشة بيضاء 500ms ثم ابدأ الأنيميشن
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _controller.forward();
      }
    });

    /// بعد ما الأنيميشن يخلص، روح للصفحة التانية
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 1000), () {
          if (mounted) {
            Navigator.pushReplacementNamed(context, AppRoutes.onboarding);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// كلمة دانا من اليمين
          SlideTransition(
            position: _danaSlide,
            child: Image.asset(
              AppAssets.right,
              width: 136,
              height: 123,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 20),

          /// القلب مع النقطتين
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// النقطتين فوق
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// النقطة الأولى
                  SlideTransition(
                    position: _dot1Slide,
                    child: Image.asset(
                      AppAssets.logoTopLeft,
                      width: 20,
                      height: 23,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 10),

                  /// النقطة الثانية
                  SlideTransition(
                    position: _dot2Slide,
                    child: Image.asset(
                      AppAssets.logoTopRight,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              /// القلب الكامل
              SlideTransition(
                position: _heartSlide,
                child: Image.asset(
                  'assets/Images/heart.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}