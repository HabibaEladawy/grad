import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomTextForm extends StatelessWidget {
//   final String text;
//   final String hintText;
//   final IconData? icon;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//
//   final Color borderColor;
//   final double borderWidth;
//
//   const CustomTextForm({
//     super.key,
//     required this.text,
//     required this.hintText,
//     this.icon,
//     this.controller,
//     this.validator,
//     this.borderColor = const Color(0xFFE3E7E8),
//     this.borderWidth = 2.0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(text, style: AppTextStyle.medium12TextHeading),
//         SizedBox(height: AppSizes.h8),
//         SizedBox(
//           width: 392.w,
//           height: 48.h,
//           child: TextFormField(
//             controller: controller,
//             validator: validator,
//             // textAlign: TextAlign.left,
//             // textDirection: TextDirection.rtl,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.white,
//
//               hintText: hintText,
//               hintStyle: AppTextStyle.regular12TextBody,
//               suffixIcon: icon != null
//                   ? Icon(icon, color: AppColors.primary_900_light, size: 26)
//                   : null,
//
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//                 borderSide: BorderSide(color: borderColor, width: borderWidth),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//                 borderSide: BorderSide(color: borderColor, width: borderWidth),
//               ),
//             ),
//           ),
//         ),
//         SizedBox(height: 16.h),
//       ],
//     );
//   }
// }


class CustomTextForm extends StatelessWidget {
  final String text;
  final String hintText;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final double? borderWidth;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int? maxLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const CustomTextForm({
    super.key,
    required this.text,
    required this.hintText,
    this.icon,
    this.controller,
    this.validator,
    this.borderColor,
    this.borderWidth,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text, style: AppTextStyle.medium12TextHeading),
        SizedBox(height: AppSizes.h8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,///بحدد نوه الكتابه
          obscureText: obscureText,///يكون محمي
          maxLines: obscureText ? 1 : maxLines, ///بقوله خاي الباسورد سطر واحد
          readOnly: readOnly,
          onTap: onTap,

          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: AppTextStyle.regular12TextBody,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),


            suffixIcon: suffixIcon ??
                (icon != null
                    ? Icon(
                  icon,
                  color: AppColors.primary_900_light,
                  size: 24,
                )
                    : null),
            prefixIcon: prefixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius_sm),
              borderSide: BorderSide(
                color: AppColors.bg_card_default_light,
                // color: borderColor ?? Color(0xFFE3E7E8),
                width: borderWidth ?? 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius_sm),
              borderSide: BorderSide(
                // color: AppColors.primary_900_light,
                color: AppColors.primary_900_light,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius_sm),
              borderSide: BorderSide(
                color: Colors.red,
                width: borderWidth ?? 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.radius_sm),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              ),
            ),
          ),
        ),

      ],
    );
  }
}