import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:dana_graduation_project/core/utils/app_theme.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/forget_password/screens/forget_password_page.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/screens/login_screen.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/new_password/screens/new_password_screen.dart';
import 'package:dana_graduation_project/features/home/presentation/views/screens/home_screen.dart';
import 'package:dana_graduation_project/features/onboarding/presentation/views/screens/onboard_screen.dart';
import 'package:dana_graduation_project/features/splash/views/screens/splash_screen.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:dana_graduation_project/providers/app_language_provider.dart';
import 'package:dana_graduation_project/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/Chat_bot/presentation/controller/data/model/message_model.dart';
import 'features/Chat_bot/presentation/views/screens/aI_Chat_Screen.dart';
import 'features/Chat_with_doctor/presentation/views/screens/Doctor_chat/screens/chat_screen.dart';
import 'features/Examination/presentation/views/screens/examination_screen.dart';
import 'features/auth/signUp/presentation/views/screens/add_children/views/screens/child_info_screen.dart';
import 'features/auth/signUp/presentation/views/screens/contact_info/presentation/views/screens/contant_Info_screen.dart';
import 'features/auth/signUp/presentation/views/screens/create_password/views/screens/create_password_screen.dart';
import 'features/auth/signUp/presentation/views/screens/sign_up/views/screens/signUp_page.dart';
import 'features/books/presentation/views/screens/books_screen.dart';
import 'features/videos/presentation/views/screens/search_Screen.dart';
import 'features/videos/presentation/views/screens/videos_Screen.dart';

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
      routes: _buildRoutes(),
    );
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    return {
      /// Core
      AppRoutes.splash:        (_) => const SplashScreen(),
      AppRoutes.onboarding:    (_) => const OnBoardScreen(),
      AppRoutes.home:          (_) =>  HomeScreen(),

      /// Auth
      AppRoutes.login:         (_) => const LoginScreen(),
      ForgetPasswordDialog.routeName: (_) => const ForgetPasswordDialog(),
      NewPasswordScreen.routeName:    (_) => const NewPasswordScreen(),

       /// Sign Up
      AppRoutes.signup:          (_) => const SignUpPage(),
      AppRoutes.createPassword:  (_) => CreatePasswordScreen(),
      AppRoutes.childInfo:       (ctx) => ChildInfoScreen(
        onNext: () => Navigator.pushNamed(ctx, AppRoutes.contactInfo),
      ),
      AppRoutes.contactInfo:     (ctx) =>  ContactInfoScreen(
        onNext: () => Navigator.pushNamed(ctx, AppRoutes.createPassword),
      ),

      /// Booking
      // AppRoutes.doctorTime:    (_) => DoctorTimeScreen(),
      // AppRoutes.reviewBooking: (_) => ReviewBookingScreen(),

      /// Chat
      ChatScreen.routeName: (context) => ChatScreen(doctor: getSampleDoctor(context)),
      AIChatScreen.routeName: (context) => AIChatScreen(doctor: getAIDoctor(context)),
      AppRoutes.videos:        (_) => const VideosScreen(),
      AppRoutes.search:        (_) => const SearchScreen(),

      /// Books
      AppRoutes.books:         (_) => const BooksScreen(),
      /// Examination
      AppRoutes.examination:   (_) => const ExaminationScreen(),
    };
  }
}
