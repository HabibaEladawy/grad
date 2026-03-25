import 'package:dana_graduation_project/core/utils/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LargeAvatar extends StatelessWidget {
  final String imageUrl;
  const LargeAvatar({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.w,
      height: 90.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        image: DecorationImage(
          image: AssetImage(AppAssets.imageBottomSheet),

        ),
      ),
    );
  }
}
