import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dana/core/widgets/custom_app_bar_button.dart';
import 'package:dana/core/widgets/custom_button.dart';
import 'package:dana/core/widgets/custom_frame.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/utils/app_raduis.dart';
import 'package:dana/core/utils/app_routes.dart';
import 'package:dana/core/utils/app_text_style.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/Chat_bot/presentation/controller/data/model/message_model.dart';
import 'package:dana/features/Chat_bot/presentation/views/screens/aI_Chat_Screen.dart';
import 'package:dana/features/home/presentation/views/screens/doctors_page.dart';
import 'package:dana/features/home/widgets/doctor_card.dart';
import 'package:dana/features/home/widgets/home_quick_access.dart';
import 'package:dana/features/home/widgets/statistics_chart.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:dana/features/parent_profile/presentation/screens/profile_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<CurvedNavigationBarState> _navKey = GlobalKey();
  int _selectedIndex = 0;

  final List<String> _icons = [
    'assets/Icons/home_icon.svg',
    'assets/Icons/doctor_icon.svg',
    'assets/Icons/chatbot_icon.svg',
    'assets/Icons/profile_icon.svg',
  ];

  final List<String> _outlinedIcons = [
    'assets/Icons/home_outlined_icon.svg',
    'assets/Icons/doctor_icon.svg',
    'assets/Icons/chatbot_icon.svg',
    'assets/Icons/profile_outlined_icon.svg',
  ];

  List<DoctorCard> doctorCards = [
    DoctorCard(
      doctorName: 'سالم غانم',
      imageSrc: 'assets/Images/home/doctor1.png',
      rate: 4.9,
      width: 137.w,
    ),
    DoctorCard(
      doctorName: 'أحمد حامد',
      imageSrc: 'assets/Images/home/doctor1.png',
      rate: 1.5,
      width: 137.w,
    ),
    DoctorCard(
      doctorName: 'التيت و الشريط',
      imageSrc: 'assets/Images/home/doctor1.png',
      width: 137.w,
    ),
    DoctorCard(
      doctorName: 'الهئ و المئ',
      imageSrc: 'assets/Images/home/doctor1.png',
      width: 137.w,
    ),
  ];

  Widget _getBody() {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    switch (_selectedIndex) {
      case 3:
        return const ProfileSection();
      case 0:
        return Stack(
          children: [
            Container(
              color: isDark
                  ? AppColors.primary_600_dark
                  : AppColors.primary_600_light,
              height: 124.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ListView(
                children: [
                  // فريم الاحصائيات
                  CustomFrame(
                    child: Column(
                      children: [
                        // الطفل
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/Images/home/boy_child_photo.png',
                              width: 48.w,
                            ),
                            SizedBox(width: 12.w),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.5.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'نوح عبدالرحمن ',
                                        style:
                                            AppTextStyle.semibold16TextHeading(
                                              context,
                                            ),
                                      ),
                                      SizedBox(width: 2.w),
                                      SvgPicture.asset(
                                        'assets/Icons/arrow_drop_icon.svg',
                                        width: 16.w,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    context.formatAge(5, 2),

                                    style: AppTextStyle.medium12TextBody(
                                      context,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            CustomButton(
                              borderRadius: AppRadius.radius_full,
                              height: 32.w,
                              width: 32.w,
                              icon: Icons.arrow_forward_ios_rounded,
                              iconSize: 14.w,
                              onTap: () {
                                Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.childProfile);
                              },
                            ),
                          ],
                        ),
                        // الاحصائيات
                        Padding(
                          padding: EdgeInsets.only(top: 12.h),
                          child: StatisticsChart(),
                        ),
                      ],
                    ),
                  ),
                  // الوصول السريع
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.l10n.quickAccess,
                          style: AppTextStyle.medium16TextHeading(context),
                        ),
                        SizedBox(height: 12.h),
                        HomeQuickAccess(context: context, isDark: isDark),
                      ],
                    ),
                  ),
                  // الافضل لرعايه طفلك
                  Column(
                    children: [
                      // العناوين
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            context.l10n.alwaysBestForChildCare,
                            style: AppTextStyle.medium16TextHeading(context),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.doctors);
                            },
                            child: Text(
                              context.l10n.viewAll,
                              style: AppTextStyle.regular12TextBody(context),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      // الدكاتره
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(doctorCards.length, (index) {
                            return Container(
                              margin: EdgeInsets.only(
                                right: index == 0 ? 0 : 4,
                                left: index == doctorCards.length - 1 ? 0 : 4,
                              ),
                              child: doctorCards[index],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 38.h),
                ],
              ),
            ),
          ],
        );
      default:
        return const SizedBox();
    }
  }

  void _goHome() {
    setState(() {
      _selectedIndex = 0;
      _navKey = GlobalKey();
    });
  }

  void _onTap(int index) {
    if (index == 2 || index == 1) {
      final pages = {
        2: AIChatScreen(doctor: getAIDoctor(context)),
        1: DoctorsScreen(),
      };

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => pages[index]!),
      ).then((_) => _goHome());
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
      appBar: _selectedIndex == 0
          ? AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: isDark
                  ? AppColors.primary_600_dark
                  : AppColors.primary_600_light,
              toolbarHeight: 72.w,
              elevation: 0,
              scrolledUnderElevation: 0,
              titleSpacing: 0,
              title: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  children: [
                    // الاشعارات
                    CustomAppBarButton(
                      width: 32.w,
                      height: 32.w,
                      iconSrc: 'assets/Icons/bill_icon.svg',
                      borderRadius: AppRadius.radius_full,
                      iconPadding: 6.r,
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.notification);
                      },
                    ),
                    Spacer(flex: 1),
                    // اللوجو
                    SvgPicture.asset(
                      'assets/Icons/home/home_logo.svg',
                      height: 32.w,
                      width: 65.w,
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: _getBody(),
      bottomNavigationBar: CurvedNavigationBar(
        key: _navKey,
        index: _selectedIndex,
        color: isDark
            ? AppColors.bg_card_default_dark
            : AppColors.bg_card_default_light,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: isDark
            ? AppColors.button_primary_default_dark
            : AppColors.button_primary_default_light,
        items: List.generate(
          _icons.length,
          (index) => Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _selectedIndex == index
                  ? Padding(
                      padding: EdgeInsets.all(8.r),
                      child: SvgPicture.asset(_icons[index], height: 24.r),
                    )
                  : Column(
                      children: [
                        SizedBox(height: 8.h),
                        SvgPicture.asset(_outlinedIcons[index], height: 24.r),
                      ],
                    ),
              if (_selectedIndex != index)
                Text(
                  [
                    context.l10n.home,
                    context.l10n.doctors,
                    context.l10n.chat,
                    context.l10n.account,
                  ][index],
                  style: AppTextStyle.medium12TextBody(context),

                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
            ],
          ),
        ),
        onTap: _onTap,
      ),
    );
  }
}
