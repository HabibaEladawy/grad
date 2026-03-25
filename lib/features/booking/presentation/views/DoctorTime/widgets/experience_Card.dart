import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_sizes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
///done

// class ExperienceCard extends StatelessWidget {
//   final String textOne;
//   final String imageAsset;
//   final String textTwo;
//
//   const ExperienceCard({
//     super.key,
//     required this.textOne,
//     required this.textTwo,
//     required this.imageAsset,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//       ),
//         color: AppColors.bg_card_default_light,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 14),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 12,
//               backgroundColor: AppColors.primary_default_light,
//               child: ImageIcon(
//                 AssetImage(imageAsset),
//                 color: AppColors.primary_50_light,
//                 size: 16,
//               ),
//             ),
//             SizedBox(width: AppSizes.w8),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   textOne,
//                   style: AppTextStyle.semibold16TextHeading,
//                   textAlign: TextAlign.right,
//                   textDirection: TextDirection.rtl,
//                 ),
//                 SizedBox(height: AppSizes.h4),
//                 Text(
//                   textTwo,
//                   style: AppTextStyle.medium12TextBody,
//                   textAlign: TextAlign.right,
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }