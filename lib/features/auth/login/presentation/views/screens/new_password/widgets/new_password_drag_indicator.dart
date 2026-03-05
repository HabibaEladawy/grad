// widgets/new_password_drag_indicator.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';

class NewPasswordDragIndicator extends StatelessWidget {
  const NewPasswordDragIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.h16),
      width: 134.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2.r),
      ),
    );
  }
}