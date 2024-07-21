import '../../config/app_environment.dart';

class Endpoints {
  Endpoints._();

  // base url
  static String baseUrl = AppEnvironment.baseApiUrl;

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;
  static var getCard = "cardart";
}
