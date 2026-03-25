import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class PaymentCardWidget extends StatelessWidget {
//   const PaymentCardWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         border: Border.all(color: const Color(0xFFE3E7E8)),
//       ),
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.centerRight,
//             child: Text('الدفع عند الزيارة', style: AppTextStyle.semibold16TextHeading),
//           ),
//           const SizedBox(height: 12),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('250 ج', style: AppTextStyle.medium12TextBody),
//               Text('تكلفة الخدمة', style: AppTextStyle.medium12TextBody),
//             ],
//           ),
//           const SizedBox(height: 8),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('0 ج', style: AppTextStyle.medium12TextBody),
//               Text('ضريبة', style: AppTextStyle.medium12TextBody),
//             ],
//           ),
//           const SizedBox(height: 12),
//           const Divider(color: Color(0xFFE3E7E8)),
//           const SizedBox(height: 12),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             decoration: BoxDecoration(
//               color: AppColors.primary_default_light.withOpacity(0.1),
//               borderRadius: BorderRadius.circular(12),
//               border: Border.all(color: AppColors.primary_default_light),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   '250 ج',
//                   style: AppTextStyle.semibold16TextHeading.copyWith(
//                     color: AppColors.primary_default_light,
//                   ),
//                 ),
//                 Text('إجمالي التكلفة', style: AppTextStyle.semibold16TextHeading),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }