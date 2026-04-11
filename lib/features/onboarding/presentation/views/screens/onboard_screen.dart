
import 'package:dana_graduation_project/features/onboarding/data/model/onboard_Model.dart';
import 'package:dana_graduation_project/features/onboarding/presentation/views/widgets/custom_nextSkip.dart';
import 'package:dana_graduation_project/features/onboarding/presentation/views/widgets/custom_onboard.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../providers/app_theme_provider.dart';

class OnBoardScreen extends StatefulWidget {
  static const String routeName = 'OnBoardScreen';
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _ScreenOnboardState();
}

class _ScreenOnboardState extends State<OnBoardScreen> {
  PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<AppThemeProvider>().appTheme == ThemeMode.dark;
    final onboardList = OnboardModel.getOnboardingData(context);


    return Scaffold(
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(  // ✅ شيل SingleChildScrollView
          children: [
            Padding(
              padding: EdgeInsets.only(top: 67.h),
              child: Image.asset(AppAssets.onboard_image),
            ),
            Expanded(  // ✅ دلوقتي هيشتغل صح
              child: PageView.builder(
                controller: controller,
                itemCount: onboardList.length,
                onPageChanged: (i) {
                  setState(() => index = i);
                },
                itemBuilder: (context, i) {
                  return CustomOnboard(
                    index: i,
                    controller: controller,
                    onboardModel: onboardList[i],
                  );
                },
              ),
            ),
            CustomNextSkip(index: index, controller: controller),
            SizedBox(height: 34.h),
          ],
        ),
      ),
    );
  }
}
