import 'package:assignment/app/widgets/empty_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../res/strings.dart';
import '../../../util/date_util.dart';
import '../../home/views/transaction_item.dart';
import '../controllers/transfer_controller.dart';

class TransferView extends GetView<TransferController> {
  const TransferView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.transfer),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return controller.transactions.isEmpty
              ? EmptyPage(title: Strings.noTransactions)
              : ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: controller.transactions.length,
                  itemBuilder: (context, index) {
                    final transaction = controller.transactions[index];
                    final transactionDate = DateTime.parse(transaction.date);

                    bool showDateHeader = index == 0 || DateTime.parse(controller.transactions[index - 1].date).difference(transactionDate).inDays != 0;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showDateHeader)
                          ListTile(
                            title: Text(DateUtil.formatDate(transactionDate), style: Theme.of(context).textTheme.headlineSmall),
                         //   trailing: const Icon(Icons.search),
                          ),
                        TransactionItem(transaction: transaction),
                      ],
                    );
                  },
                );
        }
      }),
    );
  }
}
