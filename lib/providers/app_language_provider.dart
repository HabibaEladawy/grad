import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  String appLanguage = 'ar';

  Future<void> loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    appLanguage = prefs.getString('lang') ?? 'ar';
    notifyListeners();
  }

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) return;

    appLanguage = newLanguage;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', newLanguage);

    notifyListeners();
  }
}
