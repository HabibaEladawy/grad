import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:dana_graduation_project/core/utils/app_theme.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:dana_graduation_project/providers/app_language_provider.dart';
import 'package:dana_graduation_project/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/utils/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider= Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: themeProvider.appTheme,
        locale: Locale(languageProvider.appLanguage),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      initialRoute: AppRoutes.splash,
      routes: AppRouter.routes,
    );
  }
}
