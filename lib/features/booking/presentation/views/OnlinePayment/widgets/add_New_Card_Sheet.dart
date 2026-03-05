import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/screens/card_Payment_Screen.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/card_Expiry_AndCvv_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/card_Holder_Name_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/card_Indicator_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/card_Number_Field_Widget.dart';
import 'package:flutter/material.dart';

class AddNewCardSheet extends StatelessWidget {
  const AddNewCardSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
          top: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CardIndicatorWidget(),
            const SizedBox(height: 24),
            Text('إضافة بطاقة جديدة', style: AppTextStyle.medium20TextDisplay),
            const SizedBox(height: 8),
            Text('أدخل بيانات بطاقتك لإتمام الدفع بأمان.', style: AppTextStyle.regular16TextBody),
            const SizedBox(height: 34),
            const CardNumberFieldWidget(),
            const SizedBox(height: 16),
            const CardExpiryAndCvvWidget(),
            const SizedBox(height: 16),
            const CardHolderNameWidget(),
            const SizedBox(height: 34),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CardPaymentScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary_default_light,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.radius_lg)),
                minimumSize: const Size(double.infinity, 52),
              ),
              child: Text(
                'حفظ البطاقة',
                style: AppTextStyle.semibold16TextButton.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'بيانات مشفرة ومحمية بالكامل',
                style: AppTextStyle.medium12TextBody.copyWith(color: AppColors.secondary_default_light),
              ),
            ),
          ],
        ),
      ),
    );
  }
}