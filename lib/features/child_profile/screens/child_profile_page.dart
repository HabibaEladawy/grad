
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_BackButton.dart';
import '../../../core/widgets/Custom_Toggle_Selector.dart';
import '../../../providers/app_theme_provider.dart';
import '../widget/child_info_card.dart';
import '../widget/growth_curve_section.dart';
import '../widget/next_vaccine_card.dart';
import '../widget/skills_horizontal_list.dart';
import '../widget/skills_overview_card.dart';

class ChildProfileScreen extends StatelessWidget {
  const ChildProfileScreen({super.key});

  static const String routeName = 'ChildProfileScreen';

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDark
              ? AppColors.bg_card_default_dark
              : AppColors.bg_card_default_light,
          elevation: 0,
          scrolledUnderElevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 56.w,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'عالم طفلك',
                  style: AppTextStyle.medium16TextHeading(context),
                ),
                CustomBackButton(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: ListView(
            children: [
              ChildInfoCard(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: CustomToggleSelector(
                  firstText: 'القياسات الحالية',
                  secondText: 'مهاراته الجديدة',
                  onChanged: (value) {},
                  firstContent: Column(
                    children: [
                      GrowthCurveSection(),
                      SizedBox(height: 12.h),
                      NextVaccineCard(),
                    ],
                  ),
                  secondContent: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SkillsOverviewCard(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Text(
                          'رحلة تطوره واكتشافه',
                          style: AppTextStyle.medium16TextHeading(context),
                        ),
                      ),
                      SkillsHorizontalList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
