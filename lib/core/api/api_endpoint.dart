class ApiEndpoint {
  // ── Parent / Auth ────────────────────────────────────────────────────────────
  static const String preSignUp           = '/v1/parent/pre-SignUp';
  static const String verifySignUp        = '/v1/parent/verify-signUp';
  static const String preSignIn           = '/v1/parent/pre-signIn';
  static const String verifySignIn        = '/v1/parent/verify-signIn';
  static const String resetPassword       = '/v1/parent/reset-password';
  static const String verifyPasswordOtp   = '/v1/parent/verify-password-otp';
  static const String changePassword      = '/v1/parent/change-password';
  // ── Parent / Google OAuth ────────────────────────────────────────────────────
  static const String googleSignIn        = '/v1/parent/google';
  static const String googleCallback      = '/v1/parent/google/callback';
  static const String googleComplete      = '/v1/parent/google/compelete';
  // ── Parent Profile ───────────────────────────────────────────────────────────
  static const String parentMe            = '/v1/parentMe';
  // ── Doctor ───────────────────────────────────────────────────────────────────
  static const String createDoctor        = '/v1/doctor';
  static const String getAllDoctors       = '/v1/doctor';
  static const String doctorById         = '/v1/doctor/';
  // ── Videos ───────────────────────────────────────────────────────────────────
  static const String videos             = '/v1/videos';
  static const String videoById          = '/v1/videos/';
  static const String videosSearch       = '/v1/videos/search';
  // ── Booking ──────────────────────────────────────────────────────────────────
  static const String createBooking      = '/v1/booking';
  static const String getAllBookings     = '/v1/booking';
  static const String bookingById        = '/v1/booking/';
  // ── Paymob ───────────────────────────────────────────────────────────────────
  static const String paymobCallback     = '/v1/paymob/callback';
  // ── Books ────────────────────────────────────────────────────────────────────
  static const String textBooks          = '/v1/textBooks';
  static const String bookById           = '/v1/textBooks/';
  static const String textBooksSearch    = '/v1/textBooks/search';
  // ── Sensory Test ─────────────────────────────────────────────────────────────
  static const String sensoryTest        = '/v1/sensory-test/';
  static const String sensoryTestById    = '/v1/sensory-test/';
  // ── Questions ────────────────────────────────────────────────────────────────
  static const String questions          = '/v1/questions';
  static const String questionById       = '/v1/questions/';
}