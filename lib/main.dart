import 'package:dana_graduation_project/my_app.dart';
import 'package:dana_graduation_project/providers/app_language_provider.dart';
import 'package:dana_graduation_project/providers/app_theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'core/di/injection_container.dart' as di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  FlutterError.onError = (FlutterErrorDetails details) {
    print('Flutter Error: ${details.exception}');
    print('Stack: ${details.stack}');
  };

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppLanguageProvider()),
      ChangeNotifierProvider(create: (context) => AppThemeProvider()),
    ],
    child: const Dana(),
  ));
}

class Dana extends StatelessWidget {
  const Dana({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      ensureScreenSize: true,
      builder: (context, child) {
        return MyApp();
      },
    );
  }
}
