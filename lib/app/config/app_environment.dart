import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { dev, prod }

abstract class AppEnvironment {
  static late String baseApiUrl;
  static late Environment _environment;

  Environment get environment => _environment;

  static setupEnv(Environment env) async {
    _environment = env;
    switch (env) {
      case Environment.dev:
        {
          baseApiUrl = dotenv.env['BASE_URL_DEV'] ?? "";
          break;
        }
      case Environment.prod:
        {
          baseApiUrl = dotenv.env['BASE_URL'] ?? "";

          break;
        }
    }
  }
}
