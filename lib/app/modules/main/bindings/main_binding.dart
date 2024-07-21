import 'package:assignment/app/modules/card/controllers/card_controller.dart';
import 'package:assignment/app/modules/home/controllers/home_controller.dart';
import 'package:assignment/app/modules/statistics/controllers/statistics_controller.dart';
import 'package:get/get.dart';

import '../../transfer/controllers/transfer_controller.dart';
import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );
    Get.lazyPut<TransferController>(
          () => TransferController(),
    );
    Get.lazyPut<CardController>(
          () => CardController(),
    );
    Get.lazyPut<StatisticsController>(
          () => StatisticsController(),
    );
  }
}
