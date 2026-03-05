
import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/screens/review_Booking.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/doctor_Card_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/patient_card_widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/widgets/payment_card_widget.dart';
import 'package:flutter/material.dart';

// class ReviewBookingConfirmationSheet extends StatelessWidget {
//   const ReviewBookingConfirmationSheet({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // الخط العلوي
//             Container(
//               width: 40,
//               height: 4,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFE3E7E8),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//             ),
//             const SizedBox(height: 24),
//
//             // أيقونة التأكيد
//             Container(
//               width: 64,
//               height: 64,
//               decoration: BoxDecoration(
//                 color: AppColors.primary_default_light.withOpacity(0.1),
//                 shape: BoxShape.circle,
//               ),
//               child: Icon(
//                 Icons.check_circle,
//                 color: AppColors.primary_default_light,
//                 size: 36,
//               ),
//             ),
//             const SizedBox(height: 16),
//
//             Text('تم تأكيد الحجز!', style: AppTextStyle.medium20TextDisplay),
//             const SizedBox(height: 8),
//
//             Text(
//               'سيتم التواصل معك قريباً لتأكيد الموعد.',
//               style: AppTextStyle.regular16TextBody,
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 24),
//
//             // زرار تم
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context); // يقفل الـ bottom sheet
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) => const OnlinePaymentScreen(),
//                 //   ),
//                 // );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: AppColors.primary_default_light,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 minimumSize: const Size(double.infinity, 52),
//               ),
//               child: Text(
//                 'تم',
//                 style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 8),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ============================================
// الـ Bottom Sheet: review_booking_confirmation_sheet.dart
// ============================================

// ============================================
// review_booking_confirmation_sheet.dart
// ============================================

class ReviewBookingConfirmationSheet extends StatelessWidget {
  const ReviewBookingConfirmationSheet({super.key});

  void _showReviewBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => const ReviewBookingDetailsSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE3E7E8),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: AppColors.primary_default_light.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: AppColors.primary_default_light,
                size: 36,
              ),
            ),
            const SizedBox(height: 16),
            Text('تم تأكيد الحجز!', style: AppTextStyle.medium20TextDisplay),
            const SizedBox(height: 8),
            Text(
              'سيتم التواصل معك قريباً لتأكيد الموعد.',
              style: AppTextStyle.regular16TextBody,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // يقفل الأول
                _showReviewBottomSheet(context); // يفتح التاني
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary_default_light,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 52),
              ),
              child: Text(
                'تم',
                style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class ReviewBookingDetailsSheet extends StatelessWidget {
  const ReviewBookingDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE3E7E8),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            const SizedBox(height: 16),
            Text('مراجعة الحجز', style: AppTextStyle.medium20TextDisplay),
            const SizedBox(height: 4),
            Text(
              'تأكد من التفاصيل قبل إكمال الحجز.',
              style: AppTextStyle.regular16TextBody,
            ),
            const SizedBox(height: 16),
            const DoctorCardWidget(),
            const SizedBox(height: 16),
            const PatientCardWidget(),
            const SizedBox(height: 16),
            const PaymentCardWidget(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => const ReviewBookingScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary_default_light,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 52),
              ),
              child: Text(
                'استمرار للدفع',
                style: AppTextStyle.semibold16TextHeading.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}