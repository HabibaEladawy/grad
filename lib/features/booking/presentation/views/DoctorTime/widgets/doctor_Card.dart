import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
//done
// class DoctorCard extends StatelessWidget {
//   const DoctorCard({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
//       padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
//       width: 392,
//       height: 112,
//       decoration: BoxDecoration(
//        color: AppColors.bg_card_default_light,
//         border: Border.all(color: AppColors.border_card_default_light),
//         borderRadius: BorderRadius.circular(AppRadius.radius_sm),
//
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                  AppLocalizations.of(context)!.doctorName,
//                   style: AppTextStyle.semibold20TextHeading,
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   AppLocalizations.of(context)!.doctorSpecialty,
//                   style: AppTextStyle.medium12TextBody,
//                 ),
//                 const SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.location_on,
//                       size: 16,
//                       color: AppColors.icon_onLight_light,
//                     ),
//                     const SizedBox(width: 4),
//                     Text(
//                       AppLocalizations.of(context)!.doctorLocation,
//                       style: AppTextStyle.regular12TextBody,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           Column(
//             children: [
//               Container(
//                 width: 45,
//                 height: 45,
//                 decoration: BoxDecoration(
//                   color: AppColors.button_primary_default_light,
//                   shape: BoxShape.circle,
//                 ),
//                 child: ImageIcon(
//                   const AssetImage('assets/Images/messages.png'),
//                   color: AppColors.icon_onDark_light,
//                 ),
//               ),
//            SizedBox(height: 12),
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: AppLocalizations.of(context)!.priceValue,
//                       style: AppTextStyle.semibold16TextHeading,
//                     ),
//                     TextSpan(
//                       text: AppLocalizations.of(context)!.currencyPound,
//                       style: AppTextStyle.semibold16TextHeading.copyWith(
//                         fontSize: 11,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }