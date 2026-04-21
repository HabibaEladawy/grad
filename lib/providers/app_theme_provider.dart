import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode appTheme = ThemeMode.system;

  // تحميل الثيم
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    int? savedTheme = prefs.getInt('theme');

    if (savedTheme != null) {
      appTheme = ThemeMode.values[savedTheme];
    } else {
      appTheme = ThemeMode.system;
    }
  }

  // حفظ الثيم
  Future<void> changeTheme(ThemeMode newTheme) async {
    if (appTheme == newTheme) return;

    appTheme = newTheme;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', newTheme.index);

    notifyListeners();
  }
}
