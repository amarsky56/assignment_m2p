import 'package:assignment/app/services/colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../text_style_util.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen((List<ConnectivityResult> connectivityResultList) {
      _updateConnectivityStatus(connectivityResultList.first);
    });
  }

  void _updateConnectivityStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: Text(
          'PLEASE CONNECT TO THE INTERNET',
          style: TextStyleUtil.k18(
            color: Colors.white,
          ),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        backgroundColor: Get.context!.brandColor2,
        icon: const Icon(
          Icons.wifi_off,
          color: Colors.white,
          size: 35,
        ),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
