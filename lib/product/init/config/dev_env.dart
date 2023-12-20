import 'package:envied/envied.dart';

import 'app_configuration.dart';

part 'dev_env.g.dart';

@Envied(
  obfuscate: true,
  path: 'asset/env/.dev.env',
)

/// Production environment variables
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @override
  String get baseUrl => _baseUrl;
}
