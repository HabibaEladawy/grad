import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_text_styles.dart';
import 'appbar_button_container.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    required this.isDark,
    required this.isRtl,
  });

  final bool isDark;
  final bool isRtl;

  @override
  Widget build(BuildContext context) {
    return AppBarButtonContainer(
      isDark: isDark,
      onTap: () => Navigator.pop(context),
      child: Icon(
        isRtl ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
        color: isDark
            ? AppColors.text_heading_dark
            : AppColors.text_heading_light,
        size: 24.w,
      ),
    );
  }
}