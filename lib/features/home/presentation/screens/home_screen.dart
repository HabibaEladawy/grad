
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_raduis.dart';
import '../../../../../core/utils/app_routes.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/widgets/Custom_BackButton.dart';
import '../../../../../core/widgets/Custom_Button.dart';
import '../../../../../core/widgets/Custom_Frame.dart';
import '../../../../../core/widgets/Custom_Text_Frame.dart';
import '../../../../../providers/app_theme_provider.dart';

import '../../../../core/di/injection_container.dart';
import '../../../Chat_bot/presentation/controller/data/model/message_model.dart';
import '../../../Chat_bot/presentation/views/screens/aI_Chat_Screen.dart';
import '../../../parent_profile/views/profile_section.dart';
import '../cubit/get_parent_profile_cubit.dart';
import '../cubit/get_parent_profile_state.dart';
import '../widgets/doctor_card_home.dart';
import '../widgets/statistics_chart.dart';
import 'doctors_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<CurvedNavigationBarState> _navKey = GlobalKey();
  int _selectedIndex = 0;

  final List<String> _labels = ['الرئيسية', 'الأطباء', 'المحادثة', 'الحساب'];

  final List<String> _icons = [
    'assets/icons/home_icon.svg',
    'assets/icons/doctor_icon.svg',
    'assets/icons/chatbot_icon.svg',
    'assets/icons/profile_icon.svg',
  ];

  final List<String> _outlinedIcons = [
    'assets/icons/home_outlined_icon.svg',
    'assets/icons/doctor_icon.svg',
    'assets/icons/chatbot_icon.svg',
    'assets/icons/profile_outlined_icon.svg',
  ];

  @override
  void initState() {
    super.initState();
  }

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
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: BlocBuilder<ParentCubit, ParentState>(
                  builder: (context, state) {
                    // ✅ جيب بيانات الـ parent من الـ state
                    final parent =
                    state is ParentLoaded ? state.parent : null;
                    final child =
                    parent != null && parent.children.isNotEmpty
                        ? parent.children.first
                        : null;

                    return ListView(
                      children: [
                        CustomFrame(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/Images/boy_child_photo.png',
                                    width: 48.w,
                                  ),
                                  SizedBox(width: 12.w),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 3.5.h,
                                    ),
                                    child: state is ParentLoading
                                        ? const CircularProgressIndicator()
                                        : state is ParentError
                                        ? Text(state.message)
                                        : Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              child?.childName ?? '',
                                              style: AppTextStyle
                                                  .semibold16TextHeading(
                                                context,
                                              ),
                                            ),
                                            SizedBox(width: 2.w),
                                            SvgPicture.asset(
                                              'assets/icons/arrow_drop_icon.svg',
                                              width: 16.w,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          '${child?.age ?? ''} سنوات',
                                          style:
                                          AppTextStyle.medium12TextBody(
                                            context,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  CustomButton(
                                    borderRadius: AppRadius.radius_full,
                                    height: 32.w,
                                    width: 32.w,
                                    icon: Icons.arrow_forward_ios_rounded,
                                    iconSize: 14.w,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                        AppRoutes.childProfile,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: StatisticsChart(),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 8.w),
                                    width: 12.w,
                                    height: 4.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.secondary_default_light,
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.radius_full,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'الطول (سم)',
                                    style:
                                    AppTextStyle.regular12TextBody(context),
                                  ),
                                  SizedBox(width: 16.w),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.w),
                                    width: 12.w,
                                    height: 4.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.icon_onLight_light,
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.radius_full,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'محيط الرأس(سم)',
                                    style:
                                    AppTextStyle.regular12TextBody(context),
                                  ),
                                  SizedBox(width: 16.w),
                                  Container(
                                    margin: EdgeInsets.only(left: 8.w),
                                    width: 12.w,
                                    height: 4.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary_default_light,
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.radius_full,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'الوزن (كجم)',
                                    style:
                                    AppTextStyle.regular12TextBody(context),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'الوصول السريع',
                                style:
                                AppTextStyle.medium16TextHeading(context),
                              ),
                              SizedBox(height: 12.h),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextFrame(
                                        width: 192.w,
                                        text: 'افحص إبنك',
                                        preIconSrc:
                                        'assets/icons/home/check_icon.svg',
                                        preIconBackgroundColor: isDark
                                            ? AppColors.primary_50_dark
                                            : AppColors.primary_50_light,
                                        preIconColor: isDark
                                            ? const Color.fromARGB(
                                          255,
                                          63,
                                          157,
                                          168,
                                        )
                                            : AppColors.primary_default_light,
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            AppRoutes.examination,
                                          );
                                        },
                                      ),
                                      CustomTextFrame(
                                        width: 192.w,
                                        text: 'الفديوهات',
                                        preIconSrc:
                                        'assets/icons/home/videos_icon.svg',
                                        preIconBackgroundColor: isDark
                                            ? AppColors.primary_50_dark
                                            : AppColors.primary_50_light,
                                        preIconColor: isDark
                                            ? const Color.fromARGB(
                                          255,
                                          63,
                                          157,
                                          168,
                                        )
                                            : AppColors.primary_default_light,
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            AppRoutes.videos,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomTextFrame(
                                        width: 192.w,
                                        text: 'الكتب والمقالات',
                                        preIconSrc:
                                        'assets/icons/home/books_icon.svg',
                                        preIconBackgroundColor: isDark
                                            ? AppColors.primary_50_dark
                                            : AppColors.primary_50_light,
                                        preIconColor: isDark
                                            ? const Color.fromARGB(
                                          255,
                                          63,
                                          157,
                                          168,
                                        )
                                            : AppColors.primary_default_light,
                                        // onTap: () {
                                        //   Navigator.of(context).pushNamed(
                                        //     AppRoutes.books,
                                        //   );
                                        // },
                                      ),
                                      CustomTextFrame(
                                        width: 192.w,
                                        text: 'التطعيمات',
                                        preIconSrc:
                                        'assets/icons/profile/vaccin_icon.svg',
                                        preIconBackgroundColor: isDark
                                            ? AppColors.primary_50_dark
                                            : AppColors.primary_50_light,
                                        preIconColor: isDark
                                            ? const Color.fromARGB(
                                          255,
                                          63,
                                          157,
                                          168,
                                        )
                                            : AppColors.primary_default_light,
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                            AppRoutes.vaccine,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'الأفضل دايمًا لرعاية طفلك',
                                  style:
                                  AppTextStyle.medium16TextHeading(context),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRoutes.doctors,
                                    );
                                  },
                                  child: Text(
                                    'عرض الكل',
                                    style:
                                    AppTextStyle.regular12TextBody(context),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            // ✅ الدكاترة من الـ API
                            state is ParentLoading
                                ? const CircularProgressIndicator()
                                : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: List.generate(
                                  parent?.children.length ?? 0,
                                      (index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        right: index == 0 ? 0 : 4,
                                        left: index ==
                                            (parent?.children.length ??
                                                0) -
                                                1
                                            ? 0
                                            : 4,
                                      ),
                                      child: DoctorCardHome(
                                        doctorName:
                                        parent!.children[index].childName,
                                        imageSrc:
                                        'assets/Images/home/doctor1.png',
                                        rate: 4.9,
                                        width: 137.w,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 38.h),
                      ],
                    );
                  },
                ),
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

    return BlocProvider(
      create: (_) => sl<ParentCubit>()..getParentProfile('parentId_هنا'),
      child: Scaffold(
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
                CustomBackButton(
                  width: 32.w,
                  height: 32.w,
                  iconSrc: 'assets/icons/bill_icon.svg',
                  borderRadius: AppRadius.radius_full,
                  iconPadding: 6.r,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.notification,
                    );
                  },
                ),
                const Spacer(flex: 1),
                SvgPicture.asset(
                  'assets/icons/home/home_logo.svg',
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
                  child: SvgPicture.asset(
                    _icons[index],
                    height: 24.r,
                  ),
                )
                    : Column(
                  children: [
                    SizedBox(height: 8.h),
                    SvgPicture.asset(
                      _outlinedIcons[index],
                      height: 24.r,
                    ),
                  ],
                ),
                if (_selectedIndex != index)
                  Text(
                    _labels[index],
                    style: AppTextStyle.medium12TextBody(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
          ),
          onTap: _onTap,
        ),
      ),
    );
  }
}