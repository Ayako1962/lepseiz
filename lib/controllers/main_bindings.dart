
import 'package:get/get.dart';
import 'package:lepseiz/controllers/auth_controller.dart';

import 'main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
      Get.put<MainController>(MainController());
  }
}