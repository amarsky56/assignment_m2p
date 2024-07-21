import 'package:get/get.dart';

import '../modules/card/bindings/card_binding.dart';
import '../modules/card/views/card_view.dart';
import '../modules/contacts/bindings/contacts_binding.dart';
import '../modules/contacts/views/contacts_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/scan/bindings/scan_binding.dart';
import '../modules/scan/views/scan_view.dart';
import '../modules/send_money/bindings/send_money_binding.dart';
import '../modules/send_money/views/send_money_view.dart';
import '../modules/statistics/bindings/statistics_binding.dart';
import '../modules/statistics/views/statistics_view.dart';
import '../modules/transfer/bindings/transfer_binding.dart';
import '../modules/transfer/views/transfer_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CONTACTS,
      page: () => const ContactsView(),
      binding: ContactsBinding(),
    ),
    GetPage(
      name: _Paths.SEND_MONEY,
      page: () => const SendMoneyView(),
      binding: SendMoneyBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.CARD,
      page: () => const CardView(),
      binding: CardBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => const StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.TRANSFER,
      page: () => const TransferView(),
      binding: TransferBinding(),
    ),
  ];
}
