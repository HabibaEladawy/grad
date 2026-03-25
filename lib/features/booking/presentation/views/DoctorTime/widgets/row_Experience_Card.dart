import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';

import 'package:flutter/material.dart';

// class RowExperienceCard extends StatelessWidget {
//   final String textOne;
//   final String textTwo;
//   final IconData icon;
//
//   const RowExperienceCard({
//     super.key,
//     required this.textOne,
//     required this.textTwo,
//     required this.icon,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding: const EdgeInsets.symmetric( vertical: 10),
//       decoration: BoxDecoration(
//         color: AppColors.bg_card_default_light,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 6,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         // mainAxisSize: MainAxisSize.min,
//         children: [
//
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(textOne, style: AppTextStyle.semibold12TextHeading),
//               Text(textTwo, style: AppTextStyle.regular12TextBody),
//             ],
//           ),
//           const SizedBox(width: 11),
//
//           Container(
//             padding: const EdgeInsets.all(6),
//             decoration: BoxDecoration(
//
//               // color: AppColors.primary_900_light.withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               icon,
//               color: AppColors.primary_900_light,
//               size: 16,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }