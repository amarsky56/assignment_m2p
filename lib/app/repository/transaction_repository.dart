import 'package:assignment/generated/assets.dart';

import '../data/transaction.dart';

class TransactionRepository {
  static Future<List<Transaction>> getTransactions() async {
    return [
      Transaction(
        sender: 'John Doe',
        amount: 100.0,
        image: Assets.imgProfile,
        date: DateTime.now().toIso8601String(),
      ),
      Transaction(
        sender: 'Bob Smith',
        amount: 200.0,
        image: Assets.imgProfile,
        date: DateTime.now().toIso8601String(),
      ),
      Transaction(
        sender: 'Alice Johnson',
        amount: 300.0,
        image: Assets.imgProfile,
        date: DateTime.now().toIso8601String(),
      ),
      Transaction(
        sender: 'Charlie Brown',
        amount: 150.0,
        image: Assets.imgProfile,
        date: DateTime.now().toIso8601String(),
      ),
      Transaction(
        sender: 'David Lee',
        amount: 250.0,
        image: Assets.imgProfile,
        date: DateTime.now().toIso8601String(),
      ),
      Transaction(
        sender: 'Emma Wilson',
        amount: 350.0,
        image: Assets.imgProfile,
        date: DateTime.now().toIso8601String(),
      ),
      Transaction(
        sender: 'Hannah Clark',
        amount: 500.0,
        image: Assets.imgProfile,
        date: DateTime.now().toIso8601String(),
      ),
      Transaction(
        sender: 'Ian Thompson',
        amount: 550.0,
        image: Assets.imgProfile,
        date: DateTime.now().toIso8601String(),
      ),
    ];
  }
}
