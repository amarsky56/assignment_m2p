import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt index = 0.obs;


  updatePageIndex(int i) {
    index.value = i;
  }
}
