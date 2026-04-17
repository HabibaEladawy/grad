
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/custom_buttom.dart';
import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_sizes.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Phone_Field.dart';
import '../views/Otp_Page.dart';

class ChangePasswordBottomSheet extends StatelessWidget {
  const ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: HomeIndicator()),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32.h, top: 24.h),
                  child: SvgPicture.asset(
                    'assets/icons/forget_password.svg',
                    width: 252.w,
                    height: 258.h,
                  ),
                ),
              ),
              Text(
                'تغيير كلمة السر',
                style: AppTextStyle.medium20TextDisplay(context),
              ),
              SizedBox(height: 8.h),
              Text(
                'عشان نحافظ على أمان حسابك، محتاجين نتأكد إنك صاحب الرقم. اكتب رقمك وهنبعتلك كود التحقق حالاً عشان تغير كلمة السر.',
                style: AppTextStyle.regular16TextBody(context),
              ),
              SizedBox(height: 32.h),
              Text(
                'رقم الهاتف',
                style: AppTextStyle.medium12TextHeading(context),
              ),
              SizedBox(height: AppSizes.h8),
              SizedBox(
                height: 64.h,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: PhoneField(),
                ),
              ),
              SizedBox(height: 114.h),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const OtpPage(mode: OtpMode.changePassword),
                    ),
                  );
                },
                text: 'إرسال كود التحقق',
                icon: Icons.arrow_forward_ios_rounded,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
