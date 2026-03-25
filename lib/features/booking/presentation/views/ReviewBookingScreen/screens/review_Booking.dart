
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';

import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/doctor_Card_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/patient_card_widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/payment_card_widget.dart';

import 'package:flutter/material.dart';

// class ReviewBookingScreen extends StatelessWidget {
//   const ReviewBookingScreen({super.key});
//   static const String routeName = 'ReviewBookingScreen';
//
//   void _showConfirmationBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (context) => Directionality(
//         textDirection: TextDirection.rtl,
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFE3E7E8),
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               Container(
//                 width: 64,
//                 height: 64,
//                 decoration: BoxDecoration(
//                   color: AppColors.primary_default_light.withOpacity(0.1),
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(Icons.check_circle, color: AppColors.primary_default_light, size: 36),
//               ),
//               const SizedBox(height: 16),
//               Text('تم تأكيد الحجز!', style: AppTextStyle.medium20TextDisplay),
//               const SizedBox(height: 8),
//               Text(
//                 'سيتم التواصل معك قريباً لتأكيد الموعد.',
//                 style: AppTextStyle.regular16TextBody,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 // onPressed: () {
//                 //   Navigator.pop(context); // يقفل الـ bottom sheet
//                 //   // Navigator.push(
//                 //   //   context,
//                 //   //   MaterialPageRoute(
//                 //   //     builder: (context) => const OnlinePaymentScreen(),
//                 //   //   ),
//                 //   // );
//                 // },
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.primary_default_light,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                   minimumSize: const Size(double.infinity, 52),
//                 ),
//                 child: Text(
//                   'تم',
//                   style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white),
//                 ),
//               ),
//               const SizedBox(height: 8),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text('مراجعة الحجز', style: AppTextStyle.medium20TextDisplay),
//               const SizedBox(height: 8),
//               Text('تأكد من التفاصيل قبل إكمال الحجز.', style: AppTextStyle.regular16TextBody),
//             ],
//           ),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//               onPressed: () => Navigator.pop(context),
//             ),
//           ],
//         ),
//         bottomNavigationBar: Padding(
//           padding: const EdgeInsets.all(16),
//           child: ElevatedButton(
//             onPressed: () => _showConfirmationBottomSheet(context),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: AppColors.primary_default_light,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(AppRadius.radius_lg),
//               ),
//               minimumSize: const Size(double.infinity, 52),
//             ),
//             child: Text(
//               'تأكيد الحجز',
//               style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white),
//             ),
//           ),
//         ),
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               SizedBox(height: 8),
//               DoctorCardWidget(),
//               SizedBox(height: 16),
//               PatientCardWidget(),
//               SizedBox(height: 16),
//               PaymentCardWidget(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

