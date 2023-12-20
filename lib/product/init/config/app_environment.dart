import 'app_configuration.dart';

/// Application environment manager class
final class AppEnvironment {
  /// Setup application environment

  AppEnvironment.setup({required AppConfiguration config}) {
    _config = config;
  }

  static late final AppConfiguration _config;
}

/// Get application environment items
enum AppEnvironmentItems {
  /// Network base url
  baseUrl;

  /// Get application environment item value
  String get value {
    try {
      switch (this) {
        case AppEnvironmentItems.baseUrl:
          return AppEnvironment._config.baseUrl;
      }
    } catch (e) {
      throw Exception('AppEnvironment is not initialized.');
    }
  }
}
