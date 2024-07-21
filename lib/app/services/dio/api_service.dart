import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  ///Post API

  ///PUT

  ///GET
  static Future<Response> getCard() async => await DioClient(Dio()).get(Endpoints.getCard);

  ///PATCH

  ///DELETE
}
