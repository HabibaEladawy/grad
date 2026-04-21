/// Central app configuration sourced from `--dart-define`.
///
/// Example:
/// `flutter run --dart-define=API_BASE_URL=http://3.64.255.173:3000/api`
class AppConfig {
  AppConfig._();

  /// Base URL including `/api` but excluding `/v1`.
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://3.64.255.173:3000/api',
  );
}

