import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/add_Card_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/credit_Card_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/payment_Details_Widget.dart';
import 'package:flutter/material.dart';

// class PaymentAddScreen extends StatelessWidget {
//   const PaymentAddScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: AppColors.bg_card_default_light,
//         bottomNavigationBar: Container(
//           padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 10,
//               ),
//             ],
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.bg_button_primary_disabled_light,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.radius_lg)),
//                     minimumSize: const Size(160, 52),
//                   ),
//                   child: Text(
//                     'إتمام الدفع',
//                     style: AppTextStyle.semibold16TextButton.copyWith(color: Colors.white),
//                   ),
//                 ),
//               ),
//               Text('250 ج', style: AppTextStyle.semibold20TextHeading),
//             ],
//           ),
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               SizedBox(height: 16),
//               CreditCardWidget(),
//               SizedBox(height: 16),
//               AddCardWidget(),
//               SizedBox(height: 24),
//             PaymentDetailsWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }