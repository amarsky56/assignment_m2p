import 'package:get/get.dart';

import '../res/strings.dart';

void showMySnackbar({String? title, required String msg}) {
  Get.isSnackbarOpen == true
      ? null
      : Get.snackbar(
          title ?? Strings.notification,
          msg,
          duration: const Duration(milliseconds: 2000),
        );
}
