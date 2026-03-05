import 'package:dana_graduation_project/core/utils/app_routes.dart';
import 'package:dana_graduation_project/core/utils/app_theme.dart';
import 'package:dana_graduation_project/features/Chat_with_doctor/presentation/views/screens/Doctor_chat/screens/doctor_chat_empty.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/forget_password/screens/forget_password_page.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/screens/login_screen.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/new_password/screens/new_password_screen.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/DoctorTime/screens/doctor_Time_screen.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/screens/review_Booking.dart';
import 'package:dana_graduation_project/features/home/presentation/views/screens/home_screen.dart';

import 'package:dana_graduation_project/features/onboarding/presentation/views/screens/onboard_screen.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/add_children/views/screens/child_info_screen.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/contact_info/presentation/views/screens/contant_Info_screen.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/create_password/views/screens/create_password_screen.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/sign_up/views/screens/signUp_page.dart';

import 'package:dana_graduation_project/features/splash/views/screens/splash_screen.dart';
import 'package:dana_graduation_project/l10n/app_localizations.dart';
import 'package:dana_graduation_project/providers/app_language_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../features/Chat_with_doctor/presentation/views/screens/Doctor_chat/screens/doctot_chat.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.doctor,

      routes: {
        AppRoutes.doctor:(context)=>DoctorChatScreen(),

        AppRoutes.doctorChat:(context)=>DoctorChatEmity(),
        AppRoutes.home:(context)=>HomeScreen(),
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.onboarding: (context) => const OnBoardScreen(),
        AppRoutes.signup: (context) => const SignUpPage(),
        AppRoutes.doctorTime: (context) =>  DoctorTimeScreen(),
        AppRoutes.createPassword: (context) => CreatePasswordScreen(),

        AppRoutes.childInfo: (context) => ChildInfoScreen(
          onNext: () => Navigator.pushNamed(context, AppRoutes.contactInfo),
        ),

        AppRoutes.contactInfo: (context) => ContactInfoScreen(
          onNext: () => Navigator.pushNamed(context, AppRoutes.createPassword),
        ),

        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.reviewBooking: (context) =>  ReviewBookingScreen(),

        ForgetPasswordDialog.routeName: (context) => const ForgetPasswordDialog(),
        NewPasswordScreen.routeName: (context) => const NewPasswordScreen(),
      },
      theme: MyThemeData.lightTheme,
      locale: Locale(languageProvider.appLanguage),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
