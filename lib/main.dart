import 'package:assignment/app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/config/app_environment.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'app/services/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "lib/app/config/.env");
  AppEnvironment.setupEnv(Environment.dev);
  await initGetServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runApp(GetMaterialApp(
    locale: Locale(Get.find<GetStorageService>().langCode, Get.find<GetStorageService>().langCodeV),
    fallbackLocale: const Locale("en", "US"),
    defaultTransition: Transition.fade,
    smartManagement: SmartManagement.full,
    debugShowCheckedModeBanner: true,
    initialRoute: AppPages.INITIAL,
    initialBinding: HomeBinding(),
    getPages: AppPages.routes,
  ));
}

Future<void> initGetServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}
