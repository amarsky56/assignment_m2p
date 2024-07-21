import 'package:assignment/app/modules/card/views/card_view.dart';
import 'package:assignment/app/modules/statistics/views/statistics_view.dart';
import 'package:assignment/app/modules/transfer/views/transfer_view.dart';
import 'package:assignment/app/routes/app_pages.dart';
import 'package:assignment/app/services/colors.dart';
import 'package:assignment/app/services/responsive_size.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../generated/assets.dart';
import '../../../res/strings.dart';
import '../../../services/text_style_util.dart';
import '../../../widgets/track_Icon.dart';
import '../../home/views/home_view.dart';
import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.index.value,
          children: const [
            HomeView(),
            TransferView(),
            CardView(),
            StatisticsView(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.brandColor1,
        onPressed: () => Get.toNamed(Routes.SCAN),
        shape: const CircleBorder(),
        child: Icon(Icons.qr_code_scanner, color: context.kWhite),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Obx(
        () => Container(
          width: 100.kh,
          color: Colors.white,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: context.kWhite,
            selectedItemColor: context.brandColor1,
            unselectedItemColor: context.kWhite3,
            selectedLabelStyle: TextStyleUtil.k14(),
            unselectedLabelStyle: TextStyleUtil.k14(),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            elevation: 0.0,
            onTap: (value) => controller.updatePageIndex(value),
            currentIndex: controller.index.value,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: controller.index.value == 0 ? context.brandColor1 : context.kWhite3),
                label: Strings.home,
              ),
              BottomNavigationBarItem(
                icon: TrackIcon(imgPath: Assets.svgTransaction, color: controller.index.value == 1 ? context.brandColor1 : context.kWhite3),
                label: Strings.transfer,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_sharp, color: controller.index.value == 2 ? context.brandColor1 : context.kWhite3),
                label: Strings.cards,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart_outline, color: controller.index.value == 3 ? context.brandColor1 : context.kWhite3),
                label: Strings.statistics,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
