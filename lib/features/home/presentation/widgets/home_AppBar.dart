import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/widgets/Custom_BackButton.dart';


class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, required this.isDark});

  final bool isDark;

  @override
  Size get preferredSize => Size.fromHeight(72.w);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
      isDark ? AppColors.primary_600_dark : AppColors.primary_600_light,
      toolbarHeight: 72.w,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          children: [
            CustomBackButton(
              width: 32.w,
              height: 32.w,
              iconSrc: 'assets/icons/bill_icon.svg',
              borderRadius: AppRadius.radius_full,
              iconPadding: 6.r,
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.notification);
              },
            ),
            const Spacer(flex: 1),
            SvgPicture.asset(
              'assets/icons/home/home_logo.svg',
              height: 32.w,
              width: 65.w,
            ),
          ],
        ),
      ),
    );
  }
}