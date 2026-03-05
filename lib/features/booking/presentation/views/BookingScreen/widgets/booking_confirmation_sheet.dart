import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/BookingScreen/widgets/review_booking_content.dart';

import 'package:flutter/material.dart';

class BookingConfirmationSheet extends StatelessWidget {
  final BuildContext parentContext;
  const BookingConfirmationSheet({super.key, required this.parentContext});

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
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 16),
            Text('تم تأكيد الحجز!', style: AppTextStyle.semibold16TextHeading),
            const SizedBox(height: 8),
            Text(
              'سيتم التواصل معك قريباً لتأكيد الموعد.',
              style: AppTextStyle.medium12TextBody,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                showModalBottomSheet(
                  context: parentContext,
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  ),
                  builder: (_) => ReviewBookingContent(parentContext: parentContext),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary_default_light,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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


