
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/custom_buttom.dart';
import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_text_style.dart';

class ConfirmDataBottomSheet extends StatelessWidget {
  const ConfirmDataBottomSheet({
    super.key,
    required this.firstText,
    required this.secondText,
  });

  final String firstText;
  final String secondText;

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
            children: [
              Center(child: HomeIndicator()),
              SizedBox(height: 20.h),
              Center(
                child: SvgPicture.asset(
                  'assets/Icons/child_profile/confirm_data_photo.svg',
                  height: 200.h,
                ),
              ),
              SizedBox(height: 23.h),
              Text(
                firstText,
                style: AppTextStyle.semibold20TextHeading(context),
              ),
              SizedBox(height: 8.h),
              Text(
                secondText,
                style: AppTextStyle.medium12TextBody(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              CustomButton(
                text: 'استمرار',
                textStyle: AppTextStyle.semibold16TextButton(context),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
