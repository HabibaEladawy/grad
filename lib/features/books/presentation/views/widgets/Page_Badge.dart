import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theming/app_text_styles.dart';

class PageBadge extends StatelessWidget {
  final int pageNumber;
  final bool isDark;

  const PageBadge({
    required this.pageNumber,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.785,
      child: Container(
        width: 24.w,
        height: 22.h,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.secondary_default_light
              : AppColors.secondary_default_dark,
          borderRadius:
          BorderRadius.circular(AppRadius.radius_xs),
        ),
        alignment: Alignment.center,
        child: Transform.rotate(
          angle: -0.785,
          child: Text(
            '$pageNumber',
            // style: AppTextStyle.medium12TextHeading(context)
            //     .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}