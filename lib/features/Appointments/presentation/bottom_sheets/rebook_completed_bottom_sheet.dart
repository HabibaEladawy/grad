import 'package:dana/core/widgets/home_indicator.dart';
import 'package:dana/core/utils/app_colors.dart';
import 'package:dana/core/widgets/custom_button.dart';
import 'package:dana/core/widgets/custom_screen_header.dart';
import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/Appointments/logic/appointment_calendar_logic.dart';
import 'package:dana/features/Appointments/presentation/bottom_sheets/confirm_appointment_bottom_sheet.dart';
import 'package:dana/features/Appointments/presentation/widgets/appointment_date_row.dart';
import 'package:dana/features/Appointments/presentation/widgets/appointment_month_navigator.dart';
import 'package:dana/features/Appointments/presentation/widgets/appointment_time_data.dart';
import 'package:dana/features/Appointments/presentation/widgets/appointment_time_grid.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RebookCompletedBottomSheet extends StatefulWidget {
  const RebookCompletedBottomSheet({super.key});

  @override
  State<RebookCompletedBottomSheet> createState() =>
      _RebookCompletedBottomSheetState();
}

class _RebookCompletedBottomSheetState
    extends State<RebookCompletedBottomSheet> {
  int _selectedTimeIndex = -1;
  DateTime _currentMonth = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime? _selectedDate;

  List<DateTime> get _dateList =>
      AppointmentCalendarLogic.getMonthDays(_currentMonth, DateTime.now());

  void _goToPreviousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      _selectedDate = null;
    });
  }

  void _goToNextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      _selectedDate = null;
    });
  }

  void _selectDate(DateTime date) {
    setState(() => _selectedDate = date);
  }

  void _selectTime(int index) {
    setState(() => _selectedTimeIndex = index);
  }

  void _onConfirm(BuildContext context, bool isDark) {
    Navigator.pop(context);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: isDark
          ? AppColors.bg_surface_default_dark
          : AppColors.bg_surface_default_light,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => const ConfirmAppointmentBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<AppThemeProvider>();
    final isDark =
        themeProvider.appTheme == ThemeMode.dark ||
        (themeProvider.appTheme == ThemeMode.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    return Padding(
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(child: HomeIndicator()),
            SizedBox(height: 20.h),
            CustomScreenHeader(
              title: context.l10n.followUpAppointmentTitle,
              subtitle: context.l10n.followUpAppointmentDesc,
            ),
            SizedBox(height: 24.h),

            AppointmentMonthNavigator(
              currentMonth: _currentMonth,
              onPrevious: _goToPreviousMonth,
              onNext: _goToNextMonth,
            ),
            SizedBox(height: 12.h),

            AppointmentDateRow(
              dates: _dateList,
              selectedDate: _selectedDate,
              onSelected: _selectDate,
            ),
            SizedBox(height: 24.h),

            AppointmentTimeGrid(
              times: AppointmentTimeData.availableTimes,
              selectedIndex: _selectedTimeIndex,
              onSelected: _selectTime,
            ),
            SizedBox(height: 40.h),

            CustomButton(
              text: context.l10n.bookFollowUpSession,
              onTap: () => _onConfirm(context, isDark),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
