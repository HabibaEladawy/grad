import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/// widget=>elevetedButton
class CustomElevatedButton extends StatelessWidget {
  ///text=>in buttom
  final String text;
  ///الفنكشن اللي هتتنفذ لما نضغط على الزرار
  final VoidCallback? onTap;
  ///(ممكن تحطيها أو لأ)
  final IconData? icon;
  ///بون الهلفيه
  final Color backgroundColor;
  ///لون النص
  final Color textColor;
  ///لون حدود الزرار
  final Color? borderColor;
  ///عرض الزرار
  final double? borderWidth;

  final double? height;
  final double? width;
  ////ارتفاع وعرض الزرار
  final double? fontSize;
  final FontWeight? fontWeight;
  ///حجم وسمك الخط
  final bool isIconAtStart;
///هل الأيقونة تيجي في الأول ولا بعد النص
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.backgroundColor = AppColors.primary_default_light,
    this.textColor = AppColors.bg_card_default_light,
    this.borderColor,
    this.borderWidth,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    this.isIconAtStart = false,
  });

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return SizedBox(
      width: 392,
      // width: width ?? double.infinity,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.radius_lg.r),
            side: BorderSide(
              color: borderColor ?? AppColors.border_button_primary_light,
              width: borderWidth ?? 0.6.w,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: _buildButtonContent(isRTL),
        ),
      ),
    );
  }

  List<Widget> _buildButtonContent(bool isRTL) {
    final textWidget = Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight ?? FontWeight.w600,
        fontSize: fontSize ?? 16.sp,
      ),
    );

    if (icon == null) {
      return [textWidget];
    }

    final iconWidget = Icon(
      icon,
      color: textColor,
      size: 18.r,
    );

    if (isIconAtStart) {
      return [
        iconWidget,
        SizedBox(width: 8.w),
        textWidget,
      ];
    }


    return [
      textWidget,
      SizedBox(width: 8.w),
      iconWidget,
    ];
  }
}

///لو انتي محددة isIconAtStart = true → يمشي على كلامك
//
// لو لا → يخلي الاتجاه حسب اللغة
//
// عربي → الأيقونة في البداية
//
// إنجليزي → الأيقونة في النهاية