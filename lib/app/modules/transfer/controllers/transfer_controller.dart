import 'package:get/get.dart';

import '../../../data/transaction.dart';
import '../../../local_db/database_service.dart';

class TransferController extends GetxController {
  final RxBool isLoading = true.obs;
  final RxList<Transaction> transactions = <Transaction>[].obs;
  final DatabaseService _databaseService = DatabaseService();

  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchTransactions();
    isLoading.value = false;
  }

  fetchTransactions() async {
    try {
      isLoading(true);
      transactions.value = await _databaseService.getTransactions();
      transactions.sort((a, b) => b.date.compareTo(a.date));
    } finally {
      isLoading(false);
    }
  }
}
