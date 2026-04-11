
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/Custom_BackButton.dart';
import '../../../../providers/app_theme_provider.dart';
import '../widgets/Appointments_List.dart';
import '../widgets/Appointments_TabBar.dart';

enum Status { upcoming, completed, cancelled }

class Appointment {
  final String doctorName;
  final String image;
  final String date;
  final String time;
  final String address;
  final Status status;

  Appointment({
    required this.doctorName,
    required this.image,
    required this.date,
    required this.time,
    required this.address,
    required this.status,
  });
}

class AppointmentsScreen extends StatefulWidget {
  static const String routeName = 'AppointmentsScreen';

  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  String activeTab = 'upcoming';

  final List<Appointment> appointments = [
    Appointment(
      doctorName: 'د. محمد خالد',
      image: 'assets/Images/appointment/doctor_image.png',
      date: 'الأحد,20 يناير ',
      time: '09:00 - 10:00 AM',
      address: 'مركز نبض . القاهره التجمع الخامس',
      status: Status.upcoming,
    ),
    Appointment(
      doctorName: 'د. محمد خالد',
      image: 'assets/Images/appointment/doctor_image.png',
      date: 'الأحد,20 يناير ',
      time: '09:00 - 10:00 AM',
      address: 'مركز نبض . القاهره التجمع الخامس',
      status: Status.completed,
    ),
    Appointment(
      doctorName: 'د. محمد خالد',
      image: 'assets/Images/appointment/doctor_image.png',
      date: 'الأحد,20 يناير ',
      time: '09:00 - 10:00 AM',
      address: 'مركز نبض . القاهره التجمع الخامس',
      status: Status.completed,
    ),
    Appointment(
      doctorName: 'د. محمد خالد',
      image: 'assets/Images/appointment/doctor_image.png',
      date: 'الأحد,20 يناير ',
      time: '09:00 - 10:00 AM',
      address: 'مركز نبض . القاهره التجمع الخامس',
      status: Status.completed,
    ),
    Appointment(
      doctorName: 'د. محمد خالد',
      image: 'assets/Images/appointment/doctor_image.png',
      date: 'الأحد,20 يناير ',
      time: '09:00 - 10:00 AM',
      address: 'مركز نبض . القاهره التجمع الخامس',
      status: Status.completed,
    ),
    Appointment(
      doctorName: 'د. محمد خالد',
      image: 'assets/Images/appointment/doctor_image.png',
      date: 'الأحد,20 يناير ',
      time: '09:00 - 10:00 AM',
      address: 'مركز نبض . القاهره التجمع الخامس',
      status: Status.completed,
    ),
    Appointment(
      doctorName: 'د. محمد خالد',
      image: 'assets/Images/appointment/doctor_image.png',
      date: 'الأحد,20 يناير ',
      time: '09:00 - 10:00 AM',
      address: 'مركز نبض . القاهره التجمع الخامس',
      status: Status.cancelled,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Scaffold(
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
                'الحجوزات',
                style: AppTextStyle.medium16TextHeading(context),
              ),
              CustomBackButton(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.home);
                },
              ),
            ],
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            AppointmentsTabBar(
              activeTab: activeTab,
              onTabChanged: (value) {
                setState(() {
                  activeTab = value;
                });
              },
            ),

            Expanded(child: buildBody()),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    switch (activeTab) {
      case 'upcoming':
        return AppointmentsList(
          appointments: appointments,
          status: Status.upcoming,
        );

      case 'completed':
        return AppointmentsList(
          appointments: appointments,
          status: Status.completed,
        );

      case 'cancelled':
        return AppointmentsList(
          appointments: appointments,
          status: Status.cancelled,
        );

      default:
        return const SizedBox();
    }
  }
}