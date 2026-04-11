// lib/core/router/app_router.dart

import 'package:flutter/material.dart';
import '../../features/Appointment/presentation/screens/Appointments_Screen.dart';
import '../../features/Chat_bot/presentation/controller/data/model/message_model.dart';
import '../../features/Chat_bot/presentation/views/screens/aI_Chat_Screen.dart';
import '../../features/Chat_with_doctor/presentation/views/screens/Doctor_chat/screens/chat_screen.dart';
import '../../features/Examination/presentation/views/screens/examination_screen.dart';
import '../../features/Notification/presentation/screens/Notification_Screen.dart';
import '../../features/auth/login/presentation/views/screens/forget_password/screens/forget_password_page.dart';
import '../../features/auth/login/presentation/views/screens/login/screens/login_screen.dart';
import '../../features/auth/login/presentation/views/screens/new_password/screens/new_password_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/add_children/views/screens/child_info_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/contact_info/presentation/views/screens/contant_Info_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/create_password/views/screens/create_password_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/sign_up/views/screens/signUp_page.dart';
import '../../features/booking/presentation/views/BookingScreen/screens/Payment_Method_Screen.dart';
import '../../features/booking/presentation/views/BookingScreen/screens/Payment_Success_Screen.dart';
import '../../features/booking/presentation/views/DoctorTime/screens/doctor_Time_screen.dart';
import '../../features/booking/presentation/views/OnlinePayment/screens/Online_Payment_Screen.dart';
import '../../features/booking/presentation/views/OnlinePayment/screens/payment_Add_Screen.dart';
import '../../features/books/presentation/views/screens/books_screen.dart';
import '../../features/home/presentation/views/screens/home_screen.dart';
import '../../features/onboarding/presentation/views/screens/onboard_screen.dart';
import '../../features/splash/views/screens/splash_screen.dart';
import '../../features/videos/presentation/screens/search_Screen.dart';
import '../../features/videos/presentation/screens/videos_Screen.dart';
import 'app_routes.dart';


class AppRouter {
  static Map<String, WidgetBuilder> get routes => {
    /// Core
    AppRoutes.splash:      (_) => const SplashScreen(),
    AppRoutes.onboarding:  (_) => const OnBoardScreen(),
    AppRoutes.home:        (_) => HomeScreen(),

    /// Auth
    AppRoutes.login:                    (_) => const LoginScreen(),
    ForgetPasswordDialog.routeName:     (_) => const ForgetPasswordDialog(),
    NewPasswordScreen.routeName:        (_) => const NewPasswordScreen(),

    /// Sign Up
    AppRoutes.signup:         (_) => const SignUpPage(),
    AppRoutes.createPassword: (_) => CreatePasswordScreen(),
    AppRoutes.childInfo: (ctx) => ChildInfoScreen(
      onNext: () => Navigator.pushNamed(ctx, AppRoutes.contactInfo),
    ),
    AppRoutes.contactInfo: (ctx) => ContactInfoScreen(
      onNext: () => Navigator.pushNamed(ctx, AppRoutes.createPassword),
    ),

    /// Chat
    ChatScreen.routeName:   (ctx) => ChatScreen(doctor: getSampleDoctor(ctx)),
    AIChatScreen.routeName: (ctx) => AIChatScreen(doctor: getAIDoctor(ctx)),
    AppRoutes.videos:       (_) => const VideosScreen(),
    AppRoutes.search:       (_) => const SearchScreen(),

    /// Books
    AppRoutes.books: (_) => const BooksScreen(),

    /// Examination
    AppRoutes.examination: (_) => const ExaminationScreen(),

    /// Booking
    AppRoutes.doctorTime: (_) => DoctorTimeScreen(),
    // AppRoutes.reviewBooking: (_) => ReviewBookingScreen(),
    /// Doctors

    /// Appointments
    AppRoutes.appointments: (_) => AppointmentsScreen(),
    /// Notification
    AppRoutes.notification: (_) => const NotificationScreen(),
    /// Payment
    AppRoutes.paymentMethod: (_) => const PaymentMethodScreen(),
    AppRoutes.paymentSuccessScreen: (_) => const PaymentSuccessScreen(),
    AppRoutes.onlinePaymentScreen: (_) => const OnlinePaymentScreen(),
    AppRoutes.paymentAddScreen: (_) => const PaymentAddScreen(),
  };
}