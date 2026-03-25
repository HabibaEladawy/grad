import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/booking_confirmation_sheet.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/doctor_card.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/patient_card.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/payment_card.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/screens/payment_Add_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ReviewBooking extends StatelessWidget {
//   final BuildContext parentContext;
//
//   const ReviewBooking({super.key, required this.parentContext});
//
//   void _showConfirmationBottomSheet() {
//     Navigator.pop(parentContext);
//     showModalBottomSheet(
//       context: parentContext,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       // builder: (context) => BookingConfirmationSheet(parentContext: parentContext),
//       builder: (context) => BookingConfirmationSheet(parentContext: parentContext),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Container(
//                 width: 134,
//                 height: 5,
//                 decoration: BoxDecoration(
//                   color: AppColors.border_card_default_light,
//                   borderRadius: BorderRadius.circular(100),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text('مراجعة الحجز', style: AppTextStyle.medium20TextDisplay),
//             const SizedBox(height: 8),
//             Text('تأكد من التفاصيل قبل إكمال الحجز.', style: AppTextStyle.regular16TextBody),
//             const SizedBox(height: 24),
//             const DoctorCard(),
//             const SizedBox(height: 16),
//             const PatientCard(),
//             const SizedBox(height: 12),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Text('الدفع عند الزيارة', style: AppTextStyle.medium16TextDisplay),
//             ),
//             const SizedBox(height: 12),
//             const PaymentCard(),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: _showConfirmationBottomSheet,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.primary_default_light,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 minimumSize: const Size(double.infinity, 52),
//               ),
//               child: Text(
//                 'تأكيد الحجز',
//                 style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }