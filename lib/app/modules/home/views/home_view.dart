import 'package:assignment/app/modules/home/views/send_money_card.dart';
import 'package:assignment/app/modules/home/views/transaction_item.dart';
import 'package:assignment/app/res/dimens.dart';
import 'package:assignment/app/services/colors.dart';
import 'package:assignment/app/services/responsive_size.dart';
import 'package:assignment/app/util/date_util.dart';
import 'package:assignment/app/widgets/img_view.dart';
import 'package:assignment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/strings.dart';
import '../../../widgets/common_progress.dart';
import '../controllers/home_controller.dart';
import 'art_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Dimens.height47.kheightBox,
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimens.pad16, vertical: Dimens.pad8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: Dimens.pad8),
                      child: const CircleAvatar(
                        backgroundImage: AssetImage(Assets.imgProfile),
                      ),
                    ),
                    SizedBox(width: Dimens.width8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.totalBalance,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "\$7501.1",
                            style: Theme.of(context).textTheme.headlineSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Dimens.pad8),
                      child: CircleAvatar(
                        child: ImgView(
                          imagePath: Assets.svgNotification,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimens.height16),
                SizedBox(
                  height: Dimens.height180,
                  child: Obx(
                    () => controller.isCardLoading.value
                        ? const CommonProgress()
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.cardart.length,
                            itemBuilder: (context, index) {
                              final card = controller.cardart[index];
                              return ArtCard(card: card);
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: Dimens.height180,
                  floating: false,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsets.all(Dimens.pad16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(Strings.sendMoney, style: Theme.of(context).textTheme.headlineSmall),
                              trailing: const Icon(Icons.more_horiz)),
                          SizedBox(
                            height: Dimens.height100,
                            child: Obx(
                              () => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.zero,
                                itemCount: controller.transactions.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return InkWell(
                                      onTap: () => controller.newTransaction(),
                                      child: SendMoneyCard(
                                        title: Strings.newTransaction,
                                        img: Assets.svgTransaction,
                                      ),
                                    );
                                  }
                                  final transaction = controller.transactions[index - 1];
                                  return SendMoneyCard(
                                    title: transaction.sender,
                                    img: transaction.image,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                /*  SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(Dimens.pad16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(Strings.sendMoney, style: Theme.of(context).textTheme.headlineSmall),
                            trailing: const Icon(Icons.more_horiz)),
                        SizedBox(
                          height: Dimens.height100,
                          child: Obx(
                                () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemCount: controller.transactions.length + 1,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return InkWell(
                                    onTap: () => controller.newTransaction(),
                                    child: SendMoneyCard(
                                      title: Strings.newTransaction,
                                      img: Assets.svgTransaction,
                                    ),
                                  );
                                }
                                final transaction = controller.transactions[index - 1];
                                return SendMoneyCard(
                                  title: transaction.sender,
                                  img: transaction.image,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),*/
                SliverToBoxAdapter(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.kWhite,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimens.radius24), topRight: Radius.circular(Dimens.radius24)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: Dimens.height16),
                        Obx(() {
                          if (controller.isLoading.value) {
                            return SizedBox(height: Dimens.height47, width: Dimens.width47, child: const CommonProgress());
                          } else {
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.transactions.length,
                              itemBuilder: (context, index) {
                                final transaction = controller.transactions[index];
                                final transactionDate = DateTime.parse(transaction.date);

                                bool showDateHeader =
                                    index == 0 || DateTime.parse(controller.transactions[index - 1].date).difference(transactionDate).inDays != 0;
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (showDateHeader)
                                      ListTile(
                                        title: Text(DateUtil.formatDate(transactionDate), style: Theme.of(context).textTheme.headlineSmall),
                                        trailing: const Icon(Icons.search),
                                      ),
                                    TransactionItem(transaction: transaction),
                                  ],
                                );
                              },
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
