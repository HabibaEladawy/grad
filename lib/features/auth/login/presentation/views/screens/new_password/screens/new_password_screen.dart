import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';

import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/new_password/widgets/new_password_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../providers/app_theme_provider.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  static String routeName = 'NewPasswordScreen';

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => const NewPasswordScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.bg_surface_default_dark
            : AppColors.bg_surface_default_light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppRadius.radius_lg.r),
          topRight: Radius.circular(AppRadius.radius_lg.r),
        ),
      ),
      child: const NewPasswordBody(),
    );
  }
}