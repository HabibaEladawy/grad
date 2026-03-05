
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


// class CustomTextFormField extends StatelessWidget {
//
//   final Color? borderColor;
//   final double? borderWidth;
//   final String? hintText;
//   final TextStyle? hintStyle;
//   final String? labelText;
//   final TextStyle? labelStyle;
//   Widget?prefixIcon;
//   Widget?suffixIcon;
//   Color ?prefixIconColors;
//   Color ?suffixIconColors;
// bool?obscureText;
//   final TextEditingController? controller;
//   final String? Function(String?)? validator;
//
//
//
//   CustomTextFormField({required this.hintText,
//      this.prefixIcon, this.suffixIcon, this.obscureText,
//     required this.hintStyle, this.labelText,
//     this.controller,
//     this.validator,
//     this.borderColor = const Color(0xFFE3E7E8),
//     this.borderWidth = 2.0,
//   this.labelStyle});
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//
//       obscureText: obscureText??false,
//       obscuringCharacter: '*',
//       cursorColor: Colors.black,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white,
//
//         hintText: hintText,
//         hintStyle:hintStyle ,
//         labelText: labelText,
//         labelStyle: labelStyle,
//         prefixIcon: prefixIcon,
//         prefixIconColor: AppColors.icon_onLight_light,
//         suffixIcon: suffixIcon,
//         suffixIconColor: AppColors.icon_onLight_light,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//           borderSide: BorderSide(
//             color: Colors.white
//         )
//       ),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//             borderSide: BorderSide(),
//         ),
//         errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//             borderSide: BorderSide(
//             )
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//             borderSide: BorderSide(
//             )
//         ),
//       )
//
//     );
//   }
// }
