import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_routes.dart';
import 'package:dana/core/auth/auth_session.dart';
import 'package:dana/core/di/injection_container.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../widgets/splash_logo_part.dart';
import '../widgets/splash_right_image.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _bounceRightController;
  late AnimationController _bounceLeftController;

  late Animation<Offset> _leftSlide;
  late Animation<Offset> _rightSlide;
  late Animation<Offset> _bounceRight;
  late Animation<Offset> _bounceLeft;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _leftSlide = Tween<Offset>(begin: const Offset(-2.5, 0), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );

    _rightSlide = Tween<Offset>(begin: const Offset(2.5, 0), end: Offset.zero)
        .animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
    );

    _bounceRightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _bounceRight =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1.2)).animate(
          CurvedAnimation(
            parent: _bounceRightController,
            curve: Curves.easeInOut,
          ),
        );

    _bounceLeftController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _bounceLeft =
        Tween<Offset>(begin: Offset.zero, end: const Offset(0, -0.8)).animate(
          CurvedAnimation(
            parent: _bounceLeftController,
            curve: Curves.easeInOut,
          ),
        );

    Future.delayed(const Duration(milliseconds: 200), () {
      _slideController.forward();
    });

    _slideController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await _bounceRightController.forward();
        await _bounceRightController.reverse();

        await _bounceLeftController.forward();
        await _bounceLeftController.reverse();

        final hasToken = await sl<AuthSession>().hasToken();
        if (!mounted) return;
        Navigator.pushReplacementNamed(
          context,
          hasToken ? AppRoutes.home : AppRoutes.onboarding,
        );
      }
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _bounceRightController.dispose();
    _bounceLeftController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    final logoPart = SlideTransition(
      position: _leftSlide,
      child: SplashLogoPart(
        bounceLeft: _bounceLeft,
        bounceRight: _bounceRight,
      ),
    );

    final rightImage = SlideTransition(
      position: _rightSlide,
      child: const SplashRightImage(),
    );

    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isRTL) ...[
              rightImage,
              SizedBox(width: 20.w),
              logoPart,
            ] else ...[
              logoPart,
              SizedBox(width: 20.w),
              rightImage,
            ],
          ],
        ),
      ),
    );
  }
}