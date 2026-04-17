
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_raduis.dart';
import '../../../core/utils/app_routes.dart';
import '../../../core/utils/app_text_style.dart';
import '../../../core/widgets/Custom_Frame.dart';
import '../../../core/widgets/Custom_Text_Frame.dart';
import '../../../providers/app_theme_provider.dart';
import '../../home/data/model/ChildModelUi.dart';
import '../bottom_sheets/add_child_bottom_sheet.dart';
import '../bottom_sheets/change_language_bottom_sheet.dart';
import '../bottom_sheets/change_theme_bottom_sheet.dart';
import '../bottom_sheets/log_out_bottom_sheet.dart';
import '../bottom_sheets/settings_bottom_sheet.dart';
import '../widgets/add_child_card.dart';
import '../widgets/child_card.dart';

class ProfileSection extends StatefulWidget {
  static const String routeName = 'ProfileSection';

  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  int? selectedIndex = 1;

  List<ChildModelUi> children = [
    ChildModelUi(name: "نوح", age: "4 سنوات", gender: 1),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Padding(
      padding: EdgeInsets.only(top: 34.5.h, right: 24.w, left: 24.w),
      child: Directionality(
        textDirection: TextDirection.rtl,
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
                        'عبدالرحمن أسامه',
                        style: AppTextStyle.semibold16TextHeading(context),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "01012345678",
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
                        "الأبناء",
                        style: AppTextStyle.medium16TextBody(context),
                      ),
                      SizedBox(height: 4.h),
                      // اضافه ابن
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: SizedBox(
                          height: 122.w,
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
                                          setState(() {
                                            children.add(child);
                                          });
                                        },
                                        selectedIndex: selectedIndex,
                                      ),
                                    );
                                  },
                                );
                              }

                              return Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: ChildCard(child: children[index]),
                              );
                            },
                          ),
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
                    'الوصول السريع',
                    style: AppTextStyle.medium16TextHeading(context),
                  ),
                  SizedBox(height: 12.h),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // الحجوزات
                            CustomTextFrame(
                              width: 192.w,
                              text: 'الحجوزات',
                              preIconSrc:
                                  'assets/icons/profile/booking_icon.svg',
                              preIconBackgroundColor: isDark
                                  ? AppColors.primary_50_dark
                                  : AppColors.primary_50_light,
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.appointments);
                              },
                            ),
                            // متابعة النمو
                            CustomTextFrame(
                              width: 192.w,
                              text: 'متابعة النمو',
                              preIconSrc: 'assets/icons/profile/groth_icon.svg',
                              preIconBackgroundColor: isDark
                                  ? AppColors.primary_50_dark
                                  : AppColors.primary_50_light,
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.childProfile);
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // التطعيمات
                            CustomTextFrame(
                              width: 192.w,
                              text: 'التطعيمات',
                              preIconSrc:
                                  'assets/icons/profile/vaccin_icon.svg',
                              preIconBackgroundColor: isDark
                                  ? AppColors.primary_50_dark
                                  : AppColors.primary_50_light,
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.vaccine);
                              },
                            ),
                            // محادثه ضنا
                            CustomTextFrame(
                              width: 192.w,
                              text: 'محادثة ضنا',
                              preIconSrc: 'assets/icons/profile/chat_icon.svg',
                              preIconBackgroundColor: isDark
                                  ? AppColors.primary_50_dark
                                  : AppColors.primary_50_light,
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.aiChat);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // الإعدادات
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'الإعدادات',
                  style: AppTextStyle.medium16TextHeading(context),
                ),
                SizedBox(height: 12.h),
                // الإعدادات
                CustomTextFrame(
                  text: 'الإعدادات',
                  width: double.infinity,
                  bottomMargin: 8.h,
                  preIconSrc: 'assets/icons/profile/settings_icon.svg',
                  sufIconSrc: 'assets/icons/profile/arrow_icon.svg',
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
                  text: 'تغير اللغة',
                  sufText: 'العربية',
                  width: double.infinity,
                  bottomMargin: 8.h,
                  preIconSrc: 'assets/icons/profile/language_icon.svg',
                  sufIconSrc: 'assets/icons/profile/arrow_icon.svg',
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
                  text: 'سمة',
                  sufText: 'نهاري',
                  width: double.infinity,
                  bottomMargin: 8.h,
                  preIconSrc: 'assets/icons/profile/theme_icon.svg',
                  sufIconSrc: 'assets/icons/profile/arrow_icon.svg',
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
                  text: 'الدعم الفني',
                  width: double.infinity,
                  bottomMargin: 8.h,
                  preIconSrc: 'assets/icons/profile/support_icon.svg',
                  sufIconSrc: 'assets/icons/profile/arrow_icon.svg',
                ),
                // تسجيل الخروج
                CustomTextFrame(
                  text: 'تسجيل الخروج',
                  textStyle: AppTextStyle.medium16ErrorDefault(context),
                  bottomMargin: 60.h,
                  width: double.infinity,
                  preIconSrc: 'assets/icons/profile/logOut_icon.svg',
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
      ),
    );
  }
}
