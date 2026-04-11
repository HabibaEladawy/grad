
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_raduis.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/Custom_BackButton.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../data/model/notification_model.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static const String routeName = 'NotificationScreen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  List<AppNotification> notifications = [
    AppNotification(
      title: 'ميعاد حمايته النهارده!',
      body:
      'بطلنا الصغير نوح عنده ميعاد مع (التطعيم الخماسي) النهارده. دي خطوة مهمة جداً لمناعته.. طمنونا، أخد الجرعة؟',
      time: '02:30 pm',
      type: NotificationType.vaccine,
    ),
    AppNotification(
      title: 'استشارتكم قربت',
      body:
      'بنفكركم بميعاد جلسة المتابعة مع د. [اسم الدكتور] بكرة الساعة ٤ العصر. جهزوا كل أسئلتكم، وإحنا دايماً معاكم.',
      time: '02:30 pm',
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: 'ميعاد حمايته النهارده!',
      body:
      'بطلنا الصغير نوح عنده ميعاد مع (التطعيم الخماسي) النهارده. دي خطوة مهمة جداً لمناعته.. طمنونا، أخد الجرعة؟',
      time: '02:30 pm',
      type: NotificationType.vaccine,
    ),
    AppNotification(
      title: 'استشارتكم قربت',
      body:
      'بنفكركم بميعاد جلسة المتابعة مع د. [اسم الدكتور] بكرة الساعة ٤ العصر. جهزوا كل أسئلتكم، وإحنا دايماً معاكم.',
      time: '02:30 pm',
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: 'جلسة الدعم',
      body:
      'نتطلع للقائكم في جلسة الدعم المباشرة غداً، حيث سنقوم بمناقشة التقدم الذي أحرزتموه.',
      time: '04:00 pm',
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: 'جلسة الدعم',
      body:
      'نتطلع للقائكم في جلسة الدعم المباشرة غداً، حيث سنقوم بمناقشة التقدم الذي أحرزتموه.',
      time: '04:00 pm',
      isRead: true,
      type: NotificationType.reminder,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    final unread = notifications.where((n) => !n.isRead).toList();
    final read = notifications.where((n) => n.isRead).toList();

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
                  'الإشعارات',
                  style: AppTextStyle.medium16TextHeading(context),
                ),
                CustomBackButton(onTap: () => Navigator.pop(context)),
              ],
            ),
          ),
        ),

        body: AnimatedSize(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            children: [
              if (unread.isNotEmpty) ...[
                _buildSectionTitle('جديدة', showMarkAll: true),
                SizedBox(height: 12.h),
                ...unread.map((n) => _buildItem(n)),
                SizedBox(height: 24.h),
              ],

              if (read.isNotEmpty) ...[
                _buildSectionTitle('سابقة', showMarkAll: false),
                SizedBox(height: 12.h),
                ...read.map((n) => _buildItem(n)),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {required bool showMarkAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyle.medium16TextHeading(context)),
        if (showMarkAll)
          GestureDetector(
            onTap: () {
              setState(() {});
              for (var n in notifications) {
                n.isRead = true;
              }
            },
            child: Text(
              'تحديد الكل كمقروء',
              style: AppTextStyle.regular12TextBody(context),
            ),
          ),
      ],
    );
  }

  String _getIconPath(NotificationType type) {
    switch (type) {
      case NotificationType.vaccine:
        return 'assets/Icons/notification/vaccine_icon.svg';
      case NotificationType.reminder:
        return 'assets/Icons/notification/light_bill_icon.svg';
    }
  }

  Widget _buildItem(AppNotification notification) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    return GestureDetector(
      onTap: () {
        if (!notification.isRead) {
          setState(() {
            notification.isRead = true;

            notifications.remove(notification);
            notifications.insert(0, notification);
          });
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: EdgeInsets.only(bottom: 8.w),
        padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
        decoration: BoxDecoration(
          color: notification.isRead
              ? (isDark
              ? AppColors.bg_card_default_dark
              : AppColors.bg_card_default_light)
              : (isDark
              ? AppColors.primary_50_dark
              : AppColors.primary_50_light),
          borderRadius: BorderRadius.circular(AppRadius.radius_md),
          border: Border.all(
            color: notification.isRead
                ? (isDark
                ? AppColors.border_card_default_dark
                : AppColors.border_card_default_light)
                : (isDark
                ? AppColors.primary_100_dark
                : AppColors.primary_100_light),
            width: AppRadius.stroke_thin,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 8.w),
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.primary_default_dark
                    : AppColors.primary_default_light,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(3.5.r),
                child: SvgPicture.asset(_getIconPath(notification.type)),
              ),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notification.title,
                        style: AppTextStyle.semibold12TextHeading(context),
                      ),
                      Text(
                        notification.time,
                        textDirection: TextDirection.ltr,
                        style: AppTextStyle.regular8TextBody(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    notification.body,
                    style: AppTextStyle.regular12TextHeading(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}