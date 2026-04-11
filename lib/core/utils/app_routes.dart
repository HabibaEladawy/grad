
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/screens/login_screen.dart';
import 'package:dana_graduation_project/features/home/presentation/views/screens/home_screen.dart';

import 'package:dana_graduation_project/features/onboarding/presentation/views/screens/onboard_screen.dart';
import 'package:dana_graduation_project/features/splash/views/screens/splash_screen.dart';

import '../../features/Appointment/presentation/screens/Appointments_Screen.dart';
import '../../features/Chat_bot/presentation/views/screens/aI_Chat_Screen.dart';
import '../../features/Chat_with_doctor/presentation/views/screens/Doctor_chat/screens/chat_screen.dart';
import '../../features/Examination/presentation/views/screens/examination_screen.dart';
import '../../features/Notification/presentation/screens/Notification_Screen.dart';
import '../../features/auth/signUp/presentation/views/screens/add_children/views/screens/child_info_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/contact_info/presentation/views/screens/contant_Info_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/create_password/views/screens/create_password_screen.dart';
import '../../features/booking/presentation/views/BookingScreen/screens/Payment_Method_Screen.dart';
import '../../features/booking/presentation/views/BookingScreen/screens/Payment_Success_Screen.dart';
import '../../features/booking/presentation/views/OnlinePayment/screens/Online_Payment_Screen.dart';
import '../../features/booking/presentation/views/OnlinePayment/screens/payment_Add_Screen.dart';
import '../../features/books/presentation/views/screens/books_screen.dart';
import '../../features/videos/presentation/screens/search_Screen.dart';
import '../../features/videos/presentation/screens/videos_Screen.dart';


class AppRoutes {
  static const String splash        = SplashScreen.routeName;
  static const String onboarding    = OnBoardScreen.routeName;

  /// Auth
  static  String login         = LoginScreen.routeName;
  static const String signup        = 'SignUpPage';
  static const String childInfo     = ChildInfoScreen.routeName;
  static const String contactInfo   = ContactInfoScreen.routeName;
  static const String createPassword = CreatePasswordScreen.routeName;

  /// Home
  static const String home          = HomeScreen.routeName;

  /// Booking

  static const String doctorTime    = 'DoctorTimeScreen';
  // static const String reviewBooking = ReviewBookingScreen.routeName;


  /// Appointments
  static const String appointments = AppointmentsScreen.routeName;
  /// Chat
  static const String chatDoctor        = ChatScreen.routeName;
  static const String aiChat = AIChatScreen.routeName;

  /// Videos
  static const String videos        = VideosScreen.routeName;
  static const String search        = SearchScreen.routeName;

  /// Books
  static const String books         = BooksScreen.routeName;

  /// Examination
  static const String examination = ExaminationScreen.routeName;
  /// Notification
  static const String notification = NotificationScreen.routeName;
  /// Booking
  // static const String doctorTime = DoctorTimeScreen.routeName;

/// Payment
  static const String paymentMethod = PaymentMethodScreen.routeName;
  static const String paymentSuccessScreen = PaymentSuccessScreen.routeName;
  static const String onlinePaymentScreen = OnlinePaymentScreen.routeName;
  static const String paymentAddScreen = PaymentAddScreen.routeName;

}




