import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/add_New_Card_Sheet.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/credit_Card_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/payment_Details_Widget.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/OnlinePayment/widgets/payment_Success_Sheet.dart';
import 'package:flutter/material.dart';

class CardPaymentScreen extends StatelessWidget {
  const CardPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.bg_card_default_light,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    builder: (_) => const PaymentSuccessSheet(),                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary_default_light,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.radius_lg)),
                  minimumSize: const Size(160, 52),
                ),
                child: Text(
                  'إتمام الدفع',
                  style: AppTextStyle.semibold16TextButton.copyWith(color: Colors.white),
                ),
              ),
              Text('250 ج', style: AppTextStyle.semibold20TextHeading),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const CreditCardWidget(),
              const SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.border_card_default_light),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      color: AppColors.primary_default_light.withOpacity(0.1),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/Images/logos_mastercard.png', height: 24, width: 24),
                              const SizedBox(width: 8),
                              Text('Axis Bank', style: AppTextStyle.medium12TextBody),
                              const SizedBox(width: 8),
                              Text('**** **** **** 8395', style: AppTextStyle.medium12TextBody),
                            ],
                          ),
                          Radio(
                            value: true,
                            groupValue: true,
                            onChanged: (_) {},
                            activeColor: AppColors.primary_default_light,
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: AppColors.border_card_default_light),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                          ),
                          builder: (_) => const AddNewCardSheet(),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('إضافة بطاقة جديدة', style: AppTextStyle.medium12TextBody),
                          Icon(Icons.add, color: AppColors.secondary_default_light),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const PaymentDetailsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}