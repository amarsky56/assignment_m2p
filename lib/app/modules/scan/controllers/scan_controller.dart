import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../res/strings.dart';
import '../../../services/snackbar.dart';

class ScanController extends GetxController {
  final RxBool isComplete = false.obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  final RxBool isFlashlightOn = false.obs;


  Future<void> toggleFlashlight() async {
    try {
      controller!.toggleFlash();
      isFlashlightOn.value = (await controller!.getFlashStatus()) ?? false;
    } catch (e) {
      debugPrint('Could not toggle flashlight: $e');
    }
  }

  void onQrScannerViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      result = scanData;
      controller.pauseCamera();

      await Future<void>.delayed(const Duration(milliseconds: 300));

      String? myQrCode = result?.code != null && result!.code.toString().isNotEmpty ? result?.code.toString() : '';
      if (myQrCode != null && myQrCode.isNotEmpty) {
        controller.stopCamera();
        isComplete.value = true;
        showMySnackbar(msg: myQrCode);
        await Future.delayed(const Duration(seconds: 1));
        controller.scanInvert(true);
        isComplete.value = false;
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      showMySnackbar(title: Strings.permissonError, msg: Strings.cameraPermissonMsg);
    }
  }
}
