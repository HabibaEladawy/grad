// widgets/new_password_drag_indicator.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:provider/provider.dart';

import '../../../../../../../../providers/app_theme_provider.dart';
class NewPasswordDragIndicator extends StatelessWidget {
  const NewPasswordDragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;

    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.h16),
      width: 134.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[600] : Colors.grey[300],
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}