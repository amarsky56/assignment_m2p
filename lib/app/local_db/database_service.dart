import 'package:assignment/app/data/cardart_model.dart';
import 'package:assignment/generated/assets.dart';

import '../data/transaction.dart';
import 'database_helper.dart';

class DatabaseService {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;

  Future<int> insertCard(CardartModelDataCardart card) async {
    final db = await _dbHelper.database;
    return await db.insert('cards', card.toMap());
  }

  Future<void> insertCardList(List<CardartModelDataCardart> cards) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var card in cards) {
      batch.insert('cards', card.toMap());
    }

    await batch.commit(noResult: true);
  }

  Future<List<CardartModelDataCardart>> getAllCards() async {
    final db = await _dbHelper.database;
    final result = await db.query('cards');

    return result.map((map) => CardartModelDataCardart.fromMap(map)).toList();
  }

  Future<int> insertTransaction(Transaction transaction) async {
    final db = await _dbHelper.database;
    return await db.insert('transactions', transaction.toMap());
  }

  Future<void> insertTransactionList(List<Transaction> transactions) async {
    final db = await _dbHelper.database;
    final batch = db.batch();

    for (var transaction in transactions) {
      batch.insert('transactions', transaction.toMap());
    }

    await batch.commit(noResult: true);
  }

  Future<List<Transaction>> getTransactions() async {
    final db = await _dbHelper.database;
    final result = await db.query('transactions');

    return result
        .map((json) => Transaction(
              id: json['id'] as int,
              sender: json['sender'] as String,
              amount: json['amount'] as double,
              date: json['date'] as String,
              image: Assets.imgProfile,
            ))
        .toList();
  }
}
