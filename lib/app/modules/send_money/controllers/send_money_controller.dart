import 'package:assignment/app/routes/app_pages.dart';
import 'package:assignment/generated/assets.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';

import '../../../data/transaction.dart';
import '../../../local_db/database_service.dart';
import '../../../res/strings.dart';
import '../../../services/snackbar.dart';

class SendMoneyController extends GetxController {
  RxString text = "100".obs;
  final DatabaseService _databaseService = DatabaseService();
  final Rx<Contact> contact = Contact().obs;

  @override
  void onInit() {
    super.onInit();
    contact.value = Get.arguments;
  }

  onKeyboardTap(String v) {
    HapticFeedback.lightImpact();
    String currentText = text.value ?? '';
    String updatedText = currentText + v;
    int remainingAmount = 100000;
    if (int.tryParse(updatedText) != null && int.tryParse(updatedText)! >= 0 && int.tryParse(updatedText)! <= remainingAmount) {
      text.value = updatedText;
      // Get.offAllNamed(Routes.HOME);
    } else {
      showMySnackbar(
          title: Strings.amountError,
          msg: "You can use amount upto ${"100"}, since that is current pass balance" //Strings.amountErrormsg + amount.value + Strings.amountErrormsg1,
          );
    }
  }

  save() async {
    if (text.value.isEmpty) {
      showMySnackbar(msg: Strings.enterAmount);
    } else {
      final transaction = Transaction(
        sender: contact.value.displayName ?? "",
        amount: double.parse(text.value),
        date: DateTime.now().toIso8601String(), image: Assets.imgProfile, // Convert date to string
      );
      await _databaseService.insertTransaction(transaction);
      Get.offAllNamed(Routes.MAIN);
    }
  }
}
