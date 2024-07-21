import 'package:assignment/app/res/dimens.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../res/strings.dart';
import '../../../widgets/empty_page.dart';
import '../../home/views/art_card.dart';
import '../controllers/card_controller.dart';

class CardView extends GetView<CardController> {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.cards), centerTitle: true),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.cardart.isEmpty ? EmptyPage(title: Strings.noCards) : ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.cardart.length,
                itemBuilder: (context, index) {
                  final card = controller.cardart[index];
                  return ArtCard(
                    card: card,
                    width: Dimens.widthW100,
                  ).paddingOnly(bottom: Dimens.pad8);
                },
              ),
      ),
    );
  }
}
