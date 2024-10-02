import 'package:get/get.dart';

class UiController extends GetxController {
  static UiController get instance => Get.find();

  RxBool searchEnabled = false.obs;
}
