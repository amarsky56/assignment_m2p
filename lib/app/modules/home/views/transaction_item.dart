import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';
import '../../../data/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: transaction.image == null ? const AssetImage(Assets.imgProfile) : AssetImage(transaction.image),
      ),
      title: Text(transaction.sender),
      subtitle: Text('${transaction.date.substring(11, 17)} ⚈ transfer'),
      trailing: Text('-\$${transaction.amount}', style: Theme.of(context).textTheme.headlineSmall),
    );
  }
}
