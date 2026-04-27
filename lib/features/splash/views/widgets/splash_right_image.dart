import 'package:dana/App_style/app_assets.dart' hide AppAssets;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';

class SplashRightImage extends StatelessWidget {
  const SplashRightImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.right,
      width: 136.w,
      height: 123.h,
    );
  }
}