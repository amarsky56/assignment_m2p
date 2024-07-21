import 'dart:convert';
import 'dart:math';

import 'package:assignment/app/data/cardart_model.dart';
import 'package:assignment/app/routes/app_pages.dart';
import 'package:assignment/app/services/dio/api_service.dart';
import 'package:assignment/app/services/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/transaction.dart';
import '../../../local_db/database_service.dart';
import '../../../repository/transaction_repository.dart';

class HomeController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxBool isCardLoading = true.obs;
  final RxList<Transaction> transactions = <Transaction>[].obs;
  final RxList<CardartModelDataCardart> cardart = <CardartModelDataCardart>[].obs;
  final DatabaseService _databaseService = DatabaseService();

  @override
  Future<void> onInit() async {
    super.onInit();
    await Future.wait([fetchTransactions(), getCardArt()]);
    isLoading.value = false;
    isCardLoading.value = false;
  }

  Future<void> fetchTransactions() async {
    try {
      transactions.value = await _databaseService.getTransactions();
      if (transactions.isEmpty) {
        var fetchedTransactions = await TransactionRepository.getTransactions();
        transactions.assignAll(fetchedTransactions);
        _databaseService.insertTransactionList(transactions);
      }

      transactions.sort((a, b) => b.date.compareTo(a.date));
    } finally {}
  }

  Future<void> getCardArt() async {
    try {
      cardart.value = await _databaseService.getAllCards();
      if (cardart.isEmpty) {
        final response = await APIManager.getCard();
        final CardartModel data = CardartModel.fromJson(jsonDecode(response.data));
        if (data.status == "success") {
          cardart.value = data.data!.cardart!;
          for (var v in cardart) {
            v.cardNumber = generateRandomNumber().toString();
            v.cardExpiryDate = generateRandomExpiryDate();
            v.cardAmount = generateRandomNumber().toString();
          }
          _databaseService.insertCardList(cardart);
        } else {
          showMySnackbar(msg: data.message ?? "");
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  int generateRandomNumber() {
    final random = Random();
    return random.nextInt(9000) + 1000;
  }

  String generateRandomExpiryDate() {
    final random = Random();
    int month = random.nextInt(12) + 1;
    int year = DateTime.now().year + random.nextInt(10) + 1;

    return '${month.toString().padLeft(2, '0')}/${(year % 100).toString().padLeft(2, '0')}';
  }

  newTransaction() => Get.toNamed(Routes.CONTACTS);
}
