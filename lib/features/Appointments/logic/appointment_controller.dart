import 'package:flutter/material.dart';
import 'appointment_calendar_logic.dart';

class AppointmentController extends ChangeNotifier {
  int selectedTimeIndex = -1;
  DateTime currentMonth = DateTime(DateTime.now().year, DateTime.now().month);
  DateTime? selectedDate;

  List<DateTime> get dateList =>
      AppointmentCalendarLogic.getMonthDays(currentMonth, DateTime.now());

  void goToPreviousMonth() {
    currentMonth = DateTime(currentMonth.year, currentMonth.month - 1);
    selectedDate = null;
    notifyListeners();
  }

  void goToNextMonth() {
    currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    selectedDate = null;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void selectTime(int index) {
    selectedTimeIndex = index;
    notifyListeners();
  }
}
