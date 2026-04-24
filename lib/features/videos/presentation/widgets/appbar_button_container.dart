import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_text_styles.dart';

class AppBarButtonContainer extends StatelessWidget {
  const AppBarButtonContainer({
    super.key,
    required this.child,
    required this.onTap,
    required this.isDark,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.bg_surface_subtle_dark
              : AppColors.bg_surface_subtle_light,
          borderRadius: BorderRadius.circular(AppRadius.radius_sm),
          border: Border.all(
            color: isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light,
            width: AppRadius.stroke_thin,
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}