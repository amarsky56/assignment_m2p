import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/cardart_model.dart';
import '../../../local_db/database_service.dart';

class CardController extends GetxController {
  final RxList<CardartModelDataCardart> cardart = <CardartModelDataCardart>[].obs;
  final RxBool isLoading = false.obs;
  final DatabaseService _databaseService = DatabaseService();

  @override
  Future<void> onInit() async {
    super.onInit();
    await getCardArt();
    isLoading.value = false;
  }

  Future<void> getCardArt() async {
    try {
      cardart.value = await _databaseService.getAllCards();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
