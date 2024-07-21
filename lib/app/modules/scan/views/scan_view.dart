import 'package:assignment/app/res/dimens.dart';
import 'package:assignment/app/services/colors.dart';
import 'package:assignment/app/services/responsive_size.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_scanner_with_effect/qr_scanner_with_effect.dart';
import '../../../res/strings.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        centerTitle: true,
        foregroundColor: context.kWhite,
        elevation: 0,
        title: Text(Strings.scanQrCode),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.photo)),
          IconButton(onPressed: () => controller.toggleFlashlight(), icon: Obx(() => Icon(controller.isFlashlightOn.value ? Icons.flash_on : Icons.flash_off)))
        ],
      ),
      body: Stack(
        children: [
          QrScannerWithEffect(
            isScanComplete: controller.isComplete.value,
            qrKey: controller.qrKey,
            onQrScannerViewCreated: controller.onQrScannerViewCreated,
            qrOverlayBorderColor: context.kWhite2,
            qrOverlayBorderRadius: 12.kh,
            cutOutSize: 250.kh,
            cutOutBottomOffset: 0.kh,
            effectWidth: 0,
            onPermissionSet: (ctrl, p) => controller.onPermissionSet(context, ctrl, p),
          ),
          Obx(
            ()=> Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (controller.isComplete.value)
                    Text(Strings.qrCodeScanned, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: context.kWhite1))
                  else
                    Text(Strings.scanQrCodeHint, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: context.kWhite1)),
                  Dimens.height47.kheightBox,
                  Text(Strings.arentAbleToScan, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: context.kWhite1)),
                  Dimens.height8.kheightBox,
                  SizedBox(
                      width: Dimens.widthW100,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(overlayColor: context.kWhite2, side: BorderSide(color: context.kGray, width: 1)),
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.all(Dimens.pad8),
                          child: Text(
                            Strings.enterManually,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: context.kWhite),
                          ),
                        ),
                      )),
                ],
              ).paddingOnly(left: Dimens.pad16, right: Dimens.pad16, bottom: Dimens.pad32),
            ),
          )
        ],
      ),
    );
  }
}
