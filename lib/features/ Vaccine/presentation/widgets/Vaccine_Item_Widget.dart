
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_raduis.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/Custom_Text_Field.dart';
import '../../../../providers/app_theme_provider.dart';
import '../../data/model/vaccine_model.dart';
import 'Confirm_Vaccine_BottomSheet.dart';
import 'Dashed_Line_Painter.dart';

class VaccineItemWidget extends StatefulWidget {
  final VaccineItem item;

  const VaccineItemWidget({super.key, required this.item});

  @override
  State<VaccineItemWidget> createState() => _VaccineItemWidgetState();
}

class _VaccineItemWidgetState extends State<VaccineItemWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
            (themeProvider.appTheme == ThemeMode.system &&
                MediaQuery.of(context).platformBrightness == Brightness.dark);

    final ui = getUI(widget.item.status, isDark);
    final iconPath = getIconPath(widget.item.type);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // الخط و الايقونات
                SizedBox(
                  child: Column(
                    children: [
                      // الأيقونة
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ui.color),
                          shape: BoxShape.circle,
                          color: ui.color.withOpacity(0.12),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(6.r),
                          child: SvgPicture.asset(
                            iconPath,
                            color: ui.color,
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                      ),
                      // الخط
                      if (ui.lineStyle != LineStyle.none)
                        Expanded(
                          child: ui.lineStyle == LineStyle.dashed
                              ? CustomPaint(
                            size: const Size(1, double.infinity),
                            painter: DashedLinePainter(color: ui.color),
                          )
                              : Container(width: 1.w, color: ui.color),
                        ),
                    ],
                  ),
                ),
                SizedBox(width: 12.w),
                // التطعيمات
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // العنوان
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.title,
                              style: AppTextStyle.semibold16TextHeading(
                                context,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            if (widget.item.status ==
                                VaccineStatus.delayed) ...[
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: isDark
                                      ? AppColors.error_subtle_dark
                                      : AppColors.error_subtle_light,
                                  borderRadius: BorderRadius.circular(
                                    AppRadius.radius_lg,
                                  ),
                                ),
                                child: Text(
                                  'متأخر',
                                  style: AppTextStyle.semibold12ErrorDefault(
                                    context,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        //الوصف
                        Padding(
                          padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                          child: Text(
                            widget.item.description,
                            style: AppTextStyle.medium12TextHeading(context),
                          ),
                        ),
                        // التاريخ
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/Icons/vaccine/time_icon.svg',
                              color: ui.color,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              widget.item.date,
                              style: TextStyle(
                                fontFamily: 'IBMPlexSansArabic',
                                fontSize: 12.sp,
                                color: ui.color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        // Buttons
                        if (ui.showButtons) ...[
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              // تم اخذ الجرعه
                              Expanded(
                                child: GestureDetector(
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
                                      builder: (_) => ConfirmVaccineBottomSheet(
                                        firstText: 'خطوة حماية جديدة تمت!',
                                        firstTextStyle:
                                        AppTextStyle.semibold20Success(
                                          context,
                                        ),
                                        secondText:
                                        'عاش بطلنا الصغير! سجل تاريخ التطعيم عشان نحسب مواعيد الجرعات اللي جاية بدقة.',
                                        photoSrc:
                                        'assets/Icons/vaccine/vaccine_done.svg',
                                        extraWidgets: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: 24.h,
                                                bottom: 8.h,
                                              ),
                                              child: Text(
                                                'تاريخ التطعيم',
                                                style:
                                                AppTextStyle.medium12TextHeading(
                                                  context,
                                                ),
                                              ),
                                            ),
                                            CustomTextField(
                                              hintText: 'أختر تاريخ الميلاد',
                                              readOnly: true,
                                              icon:
                                              Icons.calendar_month_rounded,
                                              onTap: () async {
                                                await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime.now(),
                                                  locale: const Locale("ar"),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                        buttonText: 'حفظ في السجل',
                                        onConfirm: () {
                                          setState(() {
                                            widget.item.status =
                                                VaccineStatus.done;
                                          });
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isDark
                                          ? AppColors
                                          .button_primary_default_dark
                                          : AppColors
                                          .button_primary_default_light,
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.radius_lg,
                                      ),
                                      border: Border.all(
                                        width: AppRadius.stroke_thin,
                                        color: isDark
                                            ? AppColors
                                            .button_primary_default_dark
                                            : AppColors
                                            .button_primary_default_light,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'تم أخذ الجرعة',
                                          style:
                                          AppTextStyle.semibold12TextButton(
                                            context,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              // لم يتم بعد
                              Expanded(
                                child: GestureDetector(
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
                                      builder: (_) => ConfirmVaccineBottomSheet(
                                        firstText: 'زوروا أقرب وحدة صحية',
                                        firstTextStyle:
                                        AppTextStyle.semibold20ErrorDefault(
                                          context,
                                        ),
                                        secondText:
                                        '''ولا يهمكم.. التطعيم ده ضروري لمناعته، حاولوا تزوروا أقرب وحدة صحية 
في أقرب وقت عشان مصلحته''',
                                        photoSrc:
                                        'assets/Icons/vaccine/vaccine_not_done.svg',
                                        buttonText: 'إلغاء',
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        AppRadius.radius_lg,
                                      ),
                                      border: Border.all(
                                        width: AppRadius.stroke_bold,
                                        color: isDark
                                            ? AppColors
                                            .border_button_outlined_dark
                                            : AppColors
                                            .border_button_outlined_light,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.h,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'لم يتم بعد',
                                          style:
                                          AppTextStyle.semibold12TextButtonOutlined(
                                            context,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}