import 'package:flutter/foundation.dart';

import '../log/app_logger.dart';


class AppConfig {
  AppConfig._();

  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://rhostdev.qzz.io/api',
  );

  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN');

  static void validate() {
    if (kReleaseMode && apiBaseUrl.startsWith('http://')) {
      AppLogger.warn(
        'Release build is configured with non-HTTPS API_BASE_URL=$apiBaseUrl',
      );
    }
  }
}
