import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_assets.dart';

class SplashRightColumn extends StatelessWidget {
  final Animation<Offset> bounceRight;

  const SplashRightColumn({super.key, required this.bounceRight});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isRTL
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 5.w),
            SlideTransition(
              position: bounceRight,
              child: SvgPicture.asset(
                AppIcons.leftTopRight,
                width: 22.911792755126953.w,
                height: 22.56934356689453.h,
              ),
            ),
          ],
        ),
        SizedBox(height: 2.5.h),

        Image.asset(AppAssets.left_bottom_right,
            width: 39.w, height: 71.5.h),
      ],
    );
  }
}
