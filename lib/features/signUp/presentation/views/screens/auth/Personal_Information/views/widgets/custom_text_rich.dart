import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextRich extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final Color? dividerColor;

  const CustomTextRich({
    super.key,
    this.text,
    this.textStyle,
    this.dividerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: 1.h,
            color: dividerColor ?? AppColors.border_card_default_light,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text ?? AppLocalizations.of(context)!.registerWith,
            style: textStyle ?? AppTextStyle.medium12TextDisplay,
          ),
        ),
        Expanded(
          child: Container(
            height: 1.h,
            color: dividerColor ?? AppColors.border_card_default_light,
          ),
        ),
      ],
    );
  }
}