
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/screens/login_screen.dart';
import 'package:dana_graduation_project/features/home/presentation/views/screens/home_screen.dart';

import 'package:dana_graduation_project/features/onboarding/presentation/views/screens/onboard_screen.dart';
import 'package:dana_graduation_project/features/splash/views/screens/splash_screen.dart';

import '../../features/Chat_bot/presentation/views/screens/aI_Chat_Screen.dart';
import '../../features/Chat_with_doctor/presentation/views/screens/Doctor_chat/screens/chat_screen.dart';
import '../../features/Examination/presentation/views/screens/examination_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/add_children/views/screens/child_info_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/contact_info/presentation/views/screens/contant_Info_screen.dart';
import '../../features/auth/signUp/presentation/views/screens/create_password/views/screens/create_password_screen.dart';
import '../../features/books/presentation/views/screens/books_screen.dart';
import '../../features/videos/presentation/views/screens/search_Screen.dart';
import '../../features/videos/presentation/views/screens/videos_Screen.dart';


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
}