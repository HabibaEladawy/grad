
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../providers/app_theme_provider.dart';
import '../utils/app_colors.dart';
import '../utils/app_raduis.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     this.text,
//     required this.onTap,
//     this.icon,
//     this.iconSize,
//     this.width = double.infinity,
//     this.height,
//     this.borderWidth,
//     this.borderRadius,
//     this.color,
//     this.textStyle,
//     this.textColor,
//     this.borderColor,
//   });
//
//   final String? text;
//   final VoidCallback onTap;
//   final Color? color;
//   final Color? textColor;
//   final TextStyle? textStyle;
//   final Color? borderColor;
//   final double width;
//   final double? height;
//   final double? borderRadius;
//   final double? borderWidth;
//   final IconData? icon;
//   final double? iconSize;
//
//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = context.watch<AppThemeProvider>();
//     final isDark =
//         themeProvider.appTheme == ThemeMode.dark ||
//             (themeProvider.appTheme == ThemeMode.system &&
//                 MediaQuery.of(context).platformBrightness == Brightness.dark);
//
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(
//             borderRadius ?? AppRadius.radius_lg,
//           ),
//           border: Border.all(
//             color:
//             borderColor ??
//                 (isDark
//                     ? AppColors.border_button_primary_dark
//                     : AppColors.border_button_primary_light),
//             width: borderWidth ?? AppRadius.stroke_thin,
//           ),
//           color:
//           color ??
//               (isDark
//                   ? AppColors.button_primary_default_dark
//                   : AppColors.button_primary_default_light),
//         ),
//         width: width,
//         height: height ?? 48.h,
//         child: Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               if (text != null)
//                 Text(
//                   text!,
//                   style:
//                   textStyle ??
//                       TextStyle(
//                         color:
//                         textColor ??
//                             (isDark
//                                 ? AppColors.text_button_dark
//                                 : AppColors.text_button_light),
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.sp,
//                         fontFamily: FontFamilies.ibm,
//                       ),
//                 ),
//               if (icon != null) ...[
//                 if (text != null) SizedBox(width: 8.w),
//                 Icon(
//                   icon,
//                   color:
//                   textColor ??
//                       (isDark
//                           ? AppColors.text_button_dark
//                           : AppColors.text_button_light),
//                   size: iconSize ?? 18.r,
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }