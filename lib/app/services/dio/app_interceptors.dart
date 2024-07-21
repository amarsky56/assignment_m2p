import 'dart:async';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import '../dialog_helper.dart';
import '../snackbar.dart';
import 'exceptions.dart';

class AppInterceptors extends Interceptor {
  bool isOverlayLoader;
  bool showSnakbar;

  AppInterceptors({this.isOverlayLoader = true, this.showSnakbar = true});

  @override
  FutureOr<dynamic> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    isOverlayLoader ? DialogHelper.showLoading() : null;

    super.onRequest(options, handler);
  }

  @override
  FutureOr<dynamic> onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    isOverlayLoader ? DialogHelper.hideDialog() : null;
  }

  @override
  Future<dynamic> onError(DioException err, ErrorInterceptorHandler handler) async {
    super.onError(err, handler);

    try {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      isOverlayLoader ? DialogHelper.hideDialog() : null;
      showSnakbar == true ? showMySnackbar(msg: errorMessage, title: 'Error') : null;
    } catch (e) {
      debugPrint(e.toString());
    }

    return handler.next;
  }

  Future<Response<dynamic>> retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return Dio().request<dynamic>(requestOptions.path, data: requestOptions.data, queryParameters: requestOptions.queryParameters, options: options);
  }

// Future<bool> refreshToken() async {
//   try {
//     Get.find<GetStorageService>().setEncjwToken =
//         (await FirebaseAuth.instance.currentUser?.getIdToken(true))!;
//     print('hello from app_interceptor : ${true}');
//     return true;
//   } catch (e) {
//     print('hello from app_interceptor : ${false}');

//     return false;
//   }
// }
}
