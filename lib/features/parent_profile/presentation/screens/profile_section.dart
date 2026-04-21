import 'package:dana/core/widgets/custom_frame.dart';
import 'package:dana/core/widgets/custom_text_frame.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_raduis.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/parent_profile/presentation/widgets/profile_quick_access.dart';
import 'package:dana/features/parent_profile/data/models/child_model.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:dana/features/parent_profile/presentation/bottom_sheets/add_child_bottom_sheet.dart';
import 'package:dana/features/parent_profile/presentation/bottom_sheets/change_language_bottom_sheet.dart';
import 'package:dana/features/parent_profile/presentation/bottom_sheets/change_theme_bottom_sheet.dart';
import 'package:dana/features/parent_profile/presentation/bottom_sheets/log_out_bottom_sheet.dart';
import 'package:dana/features/parent_profile/presentation/bottom_sheets/settings_bottom_sheet.dart';
import 'package:dana/features/parent_profile/presentation/widgets/add_child_card.dart';
import 'package:dana/features/parent_profile/presentation/widgets/child_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../cubit/parent_profile_cubit.dart';
import '../cubit/parent_profile_state.dart';
import '../../data/models/parent_profile_model.dart';

class ProfileSection extends StatefulWidget {
  static const String routeName = 'ProfileSection';

  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  int? selectedIndex = 1;

  List<ChildModel> children = [
    ChildModel(name: "نوح", years: 4, months: 0, gender: 1),
  ];

  ChildModel _mapApiChildToUi(ParentChildModel apiChild) {
    final birthDate = apiChild.birthDate;
    int years = 0, months = 0;
    if (birthDate != null) {
      final now = DateTime.now();
      int y = now.year - birthDate.year;
      int m = now.month - birthDate.month;
      if (now.day < birthDate.day) m -= 1;
      if (m < 0) {
        y -= 1;
        m += 12;
      }
      years = y < 0 ? 0 : y;
      months = m < 0 ? 0 : m;
    }
    final genderStr = apiChild.gender.toLowerCase();
    final gender = genderStr == 'male' ? 1 : 2;
    return ChildModel(
      id: apiChild.id,
      name: apiChild.childName,
      years: years,
      months: months,
      gender: gender,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return BlocProvider(
      create: (_) => sl<ParentProfileCubit>()..loadMe(),
      child: BlocBuilder<ParentProfileCubit, ParentProfileState>(
        builder: (context, state) {
          if (state is ParentProfileLoaded) {
            children = state.profile.children.map(_mapApiChildToUi).toList();
          }
          return Padding(
            padding: EdgeInsets.only(top: 34.5.h, right: 24.w, left: 24.w),
            child: ListView(
              children: [
          CustomFrame(
            hPadding: 12.w,
            radius: AppRadius.radius_sm,
            child: Column(
              children: [
                // الاب
                Column(
                  children: [
                    CircleAvatar(
                      radius: 36.r,
                      backgroundImage: const AssetImage(
                        "assets/Images/parent_photo.png",
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      state is ParentProfileLoaded
                          ? state.profile.parentName
                          : 'عبدالرحمن أسامه',
                      style: AppTextStyle.semibold16TextHeading(context),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      state is ParentProfileLoaded
                          ? state.profile.phone
                          : "01012345678",
                      style: AppTextStyle.medium12TextBody(context),
                    ),
                  ],
                ),
                Divider(
                  thickness: 0,
                  color: isDark
                      ? AppColors.border_card_default_dark
                      : AppColors.border_card_default_light,
                ),
                // الابناء
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.children,
                      style: AppTextStyle.medium16TextBody(context),
                    ),
                    SizedBox(height: 4.h),
                    // اضافه ابن
                    SizedBox(
                      height: 140.w,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: children.length + 1,
                        itemBuilder: (context, index) {
                          if (index == children.length) {
                            return AddChildCard(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: isDark
                                      ? AppColors.bg_surface_default_dark
                                      : AppColors.bg_surface_default_light,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20.r),
                                    ),
                                  ),
                                  builder: (_) => AddChildBottomSheet(
                                    onAddChild: (child) {
                                      // Map UI child to API request: name + gender + birthDate
                                      final gender = child.gender == 1 ? 'male' : 'female';
                                      // Age picker stores years/months. Backend expects birthDate.
                                      final now = DateTime.now();
                                      final birthDate = DateTime(
                                        now.year - child.years,
                                        now.month - child.months,
                                        now.day,
                                      );
                                      context.read<ParentProfileCubit>().addChild(
                                            childName: child.name,
                                            gender: gender,
                                            birthDate: birthDate,
                                          );
                                    },
                                    selectedIndex: selectedIndex,
                                  ),
                                );
                              },
                            );
                          }

                          return Padding(
                            padding: EdgeInsetsDirectional.only(end: 4.w),
                            child: ChildCard(child: children[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // الوصول السريع
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.quickAccess,
                  style: AppTextStyle.medium16TextHeading(context),
                ),
                SizedBox(height: 12.h),
                ProfileQuickAccess(isDark: isDark),
              ],
            ),
          ),
          // الإعدادات
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.settings,
                style: AppTextStyle.medium16TextHeading(context),
              ),
              SizedBox(height: 12.h),
              // الإعدادات
              CustomTextFrame(
                text: context.l10n.settings,
                width: double.infinity,
                bottomMargin: 8.h,
                preIconSrc: 'assets/Icons/profile/settings_icon.svg',
                sufIconSrc: 'assets/Icons/profile/arrow_icon.svg',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: isDark
                        ? AppColors.bg_surface_default_dark
                        : AppColors.bg_surface_default_light,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    builder: (_) => const SettingsBottomSheet(),
                  );
                },
              ),
              // تغيير اللغة
              CustomTextFrame(
                text: context.l10n.changeLanguage,
                sufText: context.l10n.arabic,
                width: double.infinity,
                bottomMargin: 8.h,
                preIconSrc: 'assets/Icons/profile/language_icon.svg',
                sufIconSrc: 'assets/Icons/profile/arrow_icon.svg',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: isDark
                        ? AppColors.bg_surface_default_dark
                        : AppColors.bg_surface_default_light,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    builder: (_) => const ChangeLanguageBottomSheet(),
                  );
                },
              ),
              // تغيير السمه
              CustomTextFrame(
                text: context.l10n.theme,
                sufText: context.l10n.light,
                width: double.infinity,
                bottomMargin: 8.h,
                preIconSrc: 'assets/Icons/profile/theme_icon.svg',
                sufIconSrc: 'assets/Icons/profile/arrow_icon.svg',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    builder: (ctx) {
                      final themeProvider = ctx.watch<AppThemeProvider>();
                      final isDark =
                          themeProvider.appTheme == ThemeMode.dark ||
                          (themeProvider.appTheme == ThemeMode.system &&
                              MediaQuery.of(ctx).platformBrightness ==
                                  Brightness.dark);

                      return Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.bg_surface_default_dark
                              : AppColors.bg_surface_default_light,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20.r),
                          ),
                        ),
                        child: const ChangeThemeBottomSheet(),
                      );
                    },
                  );
                },
              ),
              // الدعم الفني
              CustomTextFrame(
                text: context.l10n.techSupport,
                width: double.infinity,
                bottomMargin: 8.h,
                preIconSrc: 'assets/Icons/profile/support_icon.svg',
                sufIconSrc: 'assets/Icons/profile/arrow_icon.svg',
              ),
              // تسجيل الخروج
              CustomTextFrame(
                text: context.l10n.logout,
                textStyle: AppTextStyle.medium16ErrorDefault(context),
                bottomMargin: 60.h,
                width: double.infinity,
                preIconSrc: 'assets/Icons/profile/logOut_icon.svg',
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: isDark
                        ? AppColors.bg_surface_default_dark
                        : AppColors.bg_surface_default_light,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    builder: (_) => const LogOutBottomSheet(),
                  );
                },
              ),
            ],
          ),
              ],
            ),
          );
        },
      ),
    );
  }
}
