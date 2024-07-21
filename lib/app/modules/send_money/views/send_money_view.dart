import 'package:assignment/app/res/dimens.dart';
import 'package:assignment/app/services/colors.dart';
import 'package:assignment/app/widgets/img_view.dart';
import 'package:assignment/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:onscreen_num_keyboard/onscreen_num_keyboard.dart';

import '../../../res/strings.dart';
import '../controllers/send_money_controller.dart';

class SendMoneyView extends GetView<SendMoneyController> {
  const SendMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.payment),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimens.height100),
            ImgView(
              height: Dimens.height62,
              width: Dimens.height62,
              imagePath: Assets.imgAirBnb,
            ),
            Text(Strings.airBnb, style: Theme.of(context).textTheme.headlineSmall),
            Text(Strings.rental, style: Theme.of(context).textTheme.bodySmall),
            SizedBox(height: Dimens.height16),
            ListTile(
              leading: Icon(Icons.monetization_on_outlined, color: context.brandColor1),
              title: Obx(() => Text(
                controller.text.value,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              )),
              trailing: Chip(
                label: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("USD"),
                    const SizedBox(width: 4),
                    ImgView(height: Dimens.height16, width: Dimens.width24, imagePath: Assets.svgUsaIcon),
                  ],
                ),
                deleteIcon: const Icon(Icons.close, color: Colors.red),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.pad8),
              child: Card(
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.credit_card),
                  ),
                  title: Text("Visa **** 1234", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold)),
                  subtitle: const Text("\$100000"),
                  trailing: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
            ),
            SizedBox(height: Dimens.height16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.pad8),
              child: Column(
                children: [
                  NumericKeyboard(
                    onKeyboardTap: (text) => controller.onKeyboardTap(text),
                    textStyle: TextStyle(
                      color: context.kBlack,
                      fontSize: 28,
                    ),
                    rightButtonFn: () {
                      HapticFeedback.heavyImpact();
                      if (controller.text.isEmpty) return;
                      controller.text.value = controller.text.value.substring(0, controller.text.value.length - 1);
                    },
                    rightButtonLongPressFn: () {
                      if (controller.text.value.isEmpty) return;
                      controller.text.value = '';
                    },
                    rightIcon: const Icon(Icons.backspace_outlined, color: Colors.blueGrey),
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(height: Dimens.height16),
                  SizedBox(
                    width: Dimens.widthW100,
                    child: ElevatedButton(
                      onPressed: () => controller.save(),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.radius8)),
                        backgroundColor: context.brandColor1,
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Text(Strings.send, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: context.kWhite)),
                    ),
                  ),
                  SizedBox(height: Dimens.height47),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
