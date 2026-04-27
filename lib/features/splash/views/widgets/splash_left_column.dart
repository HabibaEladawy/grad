import 'package:dana/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashLeftColumn extends StatelessWidget {
  final Animation<Offset> bounceLeft;

  const SplashLeftColumn({super.key, required this.bounceLeft});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
      isRTL ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        SlideTransition(
          position: bounceLeft,
          child: SvgPicture.asset(
            AppIcons.leftTopLeft,
            width: 29.964195251464844.w,
            height: 30.57416343688965.h,
          ),
        ),
        Image.asset(
          AppAssets.logoBottomLeft,
          width: 53.4.w,
          height: 93.8.h,
        ),
      ],
    );
  }
}