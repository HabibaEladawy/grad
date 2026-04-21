import 'package:dana/core/widgets/custom_app_bar.dart';
import 'package:dana/core/widgets/custom_toggle_selector.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:dana/features/child_profile/presentation/widget/child_info_card.dart';
import 'package:dana/features/child_profile/presentation/widget/growth_curve_section.dart';
import 'package:dana/features/child_profile/presentation/widget/next_vaccine_card.dart';
import 'package:dana/features/child_profile/presentation/widget/skills_horizontal_list.dart';
import 'package:dana/features/child_profile/presentation/widget/skills_overview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/injection_container.dart';
import '../cubit/growth_cubit.dart';
import '../cubit/skills_cubit.dart';

class ChildProfileScreen extends StatefulWidget {
  const ChildProfileScreen({super.key});

  static const String routeName = 'ChildProfileScreen';

  @override
  State<ChildProfileScreen> createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen> {
  late final SkillsCubit _skillsCubit;
  late final GrowthCubit _growthCubit;

  @override
  void initState() {
    super.initState();
    _skillsCubit = sl<SkillsCubit>()..loadSkills();
    _growthCubit = sl<GrowthCubit>()..load();
  }

  @override
  void dispose() {
    _skillsCubit.close();
    _growthCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _skillsCubit),
        BlocProvider.value(value: _growthCubit),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: context.l10n.childWorldTitle, isDark: isDark),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: ListView(
            children: [
            ChildInfoCard(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: CustomToggleSelector(
                firstText: context.l10n.currentMeasurements,
                secondText: context.l10n.newSkills,
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
                        context.l10n.developmentJourney,
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
