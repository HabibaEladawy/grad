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
  static const String googleSignIn        = '/v1/parent/google';           // GET
  static const String googleCallback      = '/v1/parent/google/callback';  // GET (handled by server)
  static const String googleComplete      = '/v1/parent/google/compelete'; // GET + body

  // ── Parent Profile ───────────────────────────────────────────────────────────
  static const String parentMe            = '/v1/parentMe'; // GET / PATCH / DELETE

  // ── Doctor ───────────────────────────────────────────────────────────────────
  static const String createDoctor        = '/v1/doctor';   // POST
  static const String getAllDoctors       = '/v1/doctor';   // GET
  static const String doctorById         = '/v1/doctor/';  // GET / PATCH / DELETE + id

  // ── Videos ───────────────────────────────────────────────────────────────────
  static const String videos             = '/v1/videos';         // GET all
  static const String videoById          = '/v1/videos/';        // GET by id
  static const String videosSearch       = '/v1/videos/search';  // GET ?q=

  // ── Booking ──────────────────────────────────────────────────────────────────
  static const String createBooking      = '/v1/booking';   // POST
  static const String getAllBookings     = '/v1/booking';   // GET
  static const String bookingById        = '/v1/booking/';  // GET / DELETE + id

  // ── Paymob ───────────────────────────────────────────────────────────────────
  static const String paymobCallback     = '/v1/paymob/callback'; // GET (internal)

  // ── Books ────────────────────────────────────────────────────────────────────
  static const String textBooks          = '/v1/textBooks';         // GET all
  static const String bookById           = '/v1/textBooks/';        // GET by id
  static const String textBooksSearch    = '/v1/textBooks/search';  // GET ?q=
}


