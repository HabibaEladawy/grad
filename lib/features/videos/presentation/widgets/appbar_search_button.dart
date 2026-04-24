import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import 'appbar_button_container.dart';

class AppBarSearchButton extends StatelessWidget {
  const AppBarSearchButton({
    super.key,
    required this.isDark,
    this.onTap,
  });

  final bool isDark;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBarButtonContainer(
      isDark: isDark,
      onTap: onTap,
      child: ImageIcon(
        AssetImage(AppAssets.search_normal),
        color: isDark
            ? AppColors.text_heading_dark
            : AppColors.text_heading_light,
        size: 24.w,
      ),
    );
  }
}