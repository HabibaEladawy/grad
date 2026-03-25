import 'package:dana_graduation_project/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../providers/app_theme_provider.dart';

class SendButton extends StatelessWidget {
  final VoidCallback onTap;

  const SendButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return GestureDetector(
      onTap: onTap,
      child: Transform.scale(
        scaleX: isRtl ? -1 : 1,
        child: Image.asset(
         AppAssets.send,
          width: 24,
          height: 24,
          color: isDark
              ? AppColors.icon_onLight_dark
              : AppColors.icon_onLight_light,
        ),      ),
    );  }
}