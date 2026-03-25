import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/core/widgets/Custom_indicator.dart';
import 'package:dana_graduation_project/features/onboarding/data/model/onboard_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomOnboard extends StatelessWidget {
//   final OnboardModel onboardModel;
//   final int index;
//   final PageController controller;
//
//   const CustomOnboard({
//     super.key,
//     required this.onboardModel,
//     required this.index,
//     required this.controller,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         SizedBox(height: 74.5.h),
//         Container(
//           width: 304.w,
//           height: 267.h,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(AppRadius.radius_xl.r),
//           ),
//           child: Stack(
//             clipBehavior: Clip.none,
//             alignment: Alignment.center,
//             children: [
//               Positioned(
//                 top: -40,
//                 bottom: 1,
//                 child: Image.asset(
//                   onboardModel.mainImage,
//                   fit: BoxFit.fitHeight,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 32.h),
//
//         CustomIndicatorRow(
//           currentIndex: index,
//           itemCount: 3,
//           activeWidth: 56,
//           inactiveWidth: 24,
//           height: 4,
//           spacing: 5,
//         ),
//
//         SizedBox(height: 48.h),
//         Text(
//           onboardModel.headingText,
//           textAlign: TextAlign.center,
//           style: AppTextStyle.semibold24TextHeading,
//         ),
//         SizedBox(height: 24.h),
//         Text(
//           onboardModel.textLg,
//           textAlign: TextAlign.center,
//           style: AppTextStyle.medium16TextBody,
//         ),
//       ],
//     );
//   }
// }
import 'package:dana_graduation_project/core/utils/app_raduis.dart';
import 'package:dana_graduation_project/core/utils/app_text_style.dart';
import 'package:dana_graduation_project/core/widgets/Custom_indicator.dart';
import 'package:dana_graduation_project/features/onboarding/data/model/onboard_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnboard extends StatelessWidget {
  final OnboardModel onboardModel;
  final int index;
  final PageController controller;

  const CustomOnboard({
    super.key,
    required this.onboardModel,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 74.5.h),
        SizedBox(
          width: 304.w,
          height: 267.h,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -40,
                bottom: 1,
                child: Image.asset(
                  onboardModel.mainImage,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        CustomIndicatorRow(
          currentIndex: index,
          itemCount: 3,
          activeWidth: 56,
          inactiveWidth: 24,
          height: 4,
          spacing: 5,
        ),
        SizedBox(height: 48.h),
        Text(
          onboardModel.headingText,
          textAlign: TextAlign.center,
          style: AppTextStyle.semibold24TextHeading(context),
        ),
        SizedBox(height: 24.h),
        Text(
          onboardModel.textLg,
          textAlign: TextAlign.center,
          style: AppTextStyle.medium16TextBody(context),
        ),
      ],
    );
  }
}