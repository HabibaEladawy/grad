import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../providers/app_theme_provider.dart';

class ForgetPasswordImage extends StatelessWidget {
  const ForgetPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return SvgPicture.asset(
      'assets/icons/forget_password.svg',
      height: 200.h,
      colorFilter: isDark
          ? ColorFilter.mode(Colors.white, BlendMode.srcIn)
          : null,
    );
  }
}