
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../core/constant/homeIndicator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Button.dart';

class LogOutBottomSheet extends StatefulWidget {
  const LogOutBottomSheet({super.key});

  @override
  State<LogOutBottomSheet> createState() => _LogOutBottomSheetState();
}

class _LogOutBottomSheetState extends State<LogOutBottomSheet> {
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
                  'assets/icons/profile/log_out_photo.svg',
                  width: 250.w,
                  height: 247.h,
                ),
              ),
              SizedBox(height: 23.h),
              Text(
                'تسجيل الخروج',
                style: AppTextStyle.semibold24ErrorDefault(context),
              ),
              SizedBox(height: 8.h),
              Text(
                'بيانات طفلك محفوظة بأمان. لضمان متابعة التطعيمات، يُفضل أن تبقى مسجل دخول.',
                style: AppTextStyle.medium16TextBody(context),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'خلينا متابعين',
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CustomButton(
                      color: Colors.transparent,
                      borderWidth: 1.w,
                      borderColor: AppColors.error_default_light,
                      text: 'تأكيد الخروج',
                      textColor: AppColors.error_default_light,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.login,
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
