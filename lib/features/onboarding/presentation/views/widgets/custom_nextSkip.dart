import 'package:dana_graduation_project/core/utils/app_colors.dart';
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/features/onboarding/data/model/onboard_Model.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNextSkip extends StatelessWidget {
  final int index;
  final PageController controller;

  const CustomNextSkip({
    super.key,
    required this.controller,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool isRTL = Directionality.of(context) == TextDirection.rtl;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.signup);
            },
            child: Text(
              AppLocalizations.of(context)!.skip,
              style: AppTextStyle.medium12TextBody,
            ),
          ),

          SizedBox(
            width: 188.w,
            height: 48.h,
            child: ElevatedButton(
              onPressed: () {
                if (index <
                    OnboardModel.getOnboardingData(context).length - 1) {
                  controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, AppRoutes.signup);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary_default_light,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.radius_lg),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: isRTL
                    ? [
                        Text(
                          AppLocalizations.of(context)!.next,
                          style: AppTextStyle.medium16TextBody.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ]
                    : [
                        Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
                        SizedBox(width: 8.w),
                        Text(
                          AppLocalizations.of(context)!.next,
                          style: AppTextStyle.medium16TextBody.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
