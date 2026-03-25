import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
///done
// class PatientDropdown extends StatelessWidget {
//   const PatientDropdown({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 24,),
//         Text('المريض', style: AppTextStyle.medium12TextHeading),
//         const SizedBox(height: 8),
//         Container(
//           width: 392,
//           height: 48,
//           padding: const EdgeInsets.symmetric(
//             horizontal: 24, // spacing/space-lg
//             // vertical: 14,   // spacing/space-xl
//           ),
//           decoration: BoxDecoration(
//             color: AppColors.bg_card_default_light, // Cards/bg-card-default
//             borderRadius: BorderRadius.circular(AppRadius.radius_sm), // radius-sm
//             border: const Border(
//               top: BorderSide(
//                 color:AppColors.border_card_default_light, // Cards/border-card-default
//                 width: 0.8,
//               ),
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('اختر اسم طفلك', style: AppTextStyle.regular12TextBody),
//               const Icon(Icons.keyboard_arrow_down,size: 24,
//               color: AppColors.icon_onLight_light,),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }