import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_text_styles.dart';

class VideoTabContent extends StatelessWidget {
  const VideoTabContent({
    super.key,
    required this.icon,
    required this.label,
    required this.style,
    required this.color,
  });

  final String icon;
  final String label;
  final TextStyle style;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 16.w,
          height: 16.h,
          color: color,
        ),
        SizedBox(width: 4.w),
        Text(
          label,
          style: style.copyWith(color: color),
        ),
      ],
    );
  }
}