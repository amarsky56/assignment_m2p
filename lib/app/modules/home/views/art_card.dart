import 'package:assignment/app/services/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../data/cardart_model.dart';
import '../../../res/dimens.dart';
import '../../../res/strings.dart';
import '../../../widgets/img_view.dart';
import '../controllers/home_controller.dart';

class ArtCard extends GetView<HomeController> {
  final CardartModelDataCardart card;
  final double? width;

  const ArtCard({super.key, required this.card, this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.pad8),
      child: SizedBox(
        width: width ?? Dimens.width300,
        height: Dimens.height180,
        child: Stack(
          children: [
            ImgView(
              height: Dimens.height180,
              width: width ?? Dimens.width300,
              fit: BoxFit.fill,
              imagePath: card.url ?? "",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  title: Text(Strings.debitCard, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: context.kWhite)),
                  trailing: Text(Strings.visa, style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: context.kWhite, fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  title: Text("\$7501.1", style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: context.kWhite)),
                  trailing: Icon(Icons.remove_red_eye_outlined, color: context.kWhite),
                ),
                ListTile(
                  title: Text("...${(card.cardNumber ?? "")}", style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: context.kWhite)),
                  trailing: Text((card.cardExpiryDate ?? ""), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: context.kWhite)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
