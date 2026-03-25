import 'package:dana_graduation_project/my_app.dart';
import 'package:dana_graduation_project/providers/app_language_provider.dart';
import 'package:dana_graduation_project/providers/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  ///دول عشان الشريط ال فوق ميظهرش
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  ///عشان ارن الابلكيشن
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),

      ],
      child: Dana()));
}

class Dana extends StatelessWidget {
  const Dana({super.key});

  @override
  Widget build(BuildContext context) {
///Code => Responsive
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      builder: (context, child) {
        return MyApp();
      },
    );
  }
}
