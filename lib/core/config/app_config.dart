import 'package:flutter/foundation.dart';

import '../log/app_logger.dart';

/// Central app configuration sourced from `--dart-define`.
///
/// Example:
/// `flutter run --dart-define=API_BASE_URL=http://3.64.255.173:3000/api`
class AppConfig {
  AppConfig._();

  /// Base URL for API calls.
  ///
  /// Note: our endpoints already include `/v1/...`. Some environments provide
  /// `.../api` as a prefix, but the backend routes do not. We normalize it.
  static final String apiBaseUrl = (() {
    final raw = const String.fromEnvironment(
      'API_BASE_URL',
      defaultValue: 'http://3.64.255.173:3000',
    ).trim();
    if (raw.isEmpty) return raw;
    // Strip trailing `/api` to avoid calling `/api/v1/...`.
    if (raw.endsWith('/api')) return raw.substring(0, raw.length - 4);
    if (raw.endsWith('/api/')) return raw.substring(0, raw.length - 5);
    return raw.endsWith('/') ? raw.substring(0, raw.length - 1) : raw;
  })();

  /// Sentry DSN for crash reporting (leave empty to disable).
  static const String sentryDsn = String.fromEnvironment('SENTRY_DSN');

  /// Call once at startup to validate critical config.
  ///
  /// We don't hard-crash in release (it would be a bad UX), but we *do* surface
  /// a strong signal in logs so misconfigured releases are caught quickly.
  static void validate() {
    if (kReleaseMode && apiBaseUrl.startsWith('http://')) {
      AppLogger.warn(
        'Release build is configured with non-HTTPS API_BASE_URL=$apiBaseUrl',
      );
    }
  }
}
