import 'package:dana/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:dana/providers/app_language_provider.dart';
import 'package:dana/providers/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:dana/core/di/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  final themeProvider = AppThemeProvider();
  await themeProvider.loadTheme();

  final languageProvider = AppLanguageProvider();
  await languageProvider.loadLanguage();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: languageProvider),
        ChangeNotifierProvider.value(value: themeProvider),
      ],
      child: const Dana(),
    ),
  );
}

class Dana extends StatelessWidget {
  const Dana({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      builder: (context, child) {
        return MyApp();
      },
    );
  }
}
