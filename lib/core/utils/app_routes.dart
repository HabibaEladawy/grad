
import 'package:dana_graduation_project/features/Chat_with_doctor/presentation/views/screens/Doctor_chat/screens/doctor_chat_empty.dart';
import 'package:dana_graduation_project/features/auth/login/presentation/views/screens/login/screens/login_screen.dart';
import 'package:dana_graduation_project/features/booking/presentation/views/ReviewBookingScreen/screens/review_Booking.dart';
import 'package:dana_graduation_project/features/home/presentation/views/screens/home_screen.dart';

import 'package:dana_graduation_project/features/onboarding/presentation/views/screens/onboard_screen.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/add_children/views/screens/child_info_screen.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/contact_info/presentation/views/screens/contant_Info_screen.dart';
import 'package:dana_graduation_project/features/signUp/presentation/views/screens/auth/create_password/views/screens/create_password_screen.dart';
import 'package:dana_graduation_project/features/splash/views/screens/splash_screen.dart';

import '../../features/Chat_with_doctor/presentation/views/screens/Doctor_chat/screens/doctot_chat.dart';


class AppRoutes {
  static const String splash = SplashScreen.routeName;
  static const String doctor = DoctorChatScreen.routeName;
  static const String doctorChat = DoctorChatEmity.routeName;
  static const String home = HomeScreen.routeName;
  static const String onboarding = OnBoardScreen.routeName;
  static  String login = LoginScreen.routeName;
  static const String signup = 'SignUpPage';
  static const String childInfo = ChildInfoScreen.routeName;
  static final String reviewBooking = ReviewBookingScreen.routeName;
  static const String contactInfo = ContactInfoScreen.routeName;
// static const String otp = OtpBottomSheet.routeName;
static const String createPassword = CreatePasswordScreen.routeName;
  static const String doctorTime = 'DoctorTimeScreen';
// static const String forgetPassword = ForgetPasswordPage.routeName;
// static const String newPassword = NewPasswordPage.routeName;
// static const String home = HomePage.routeName;
// static const String doctorTime = DoctorTime.routeName;
}