import 'package:get/get.dart';

import '../controller/inpireV_home_controller.dart';

class InspireVHomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InspireVHomeScreenController>(InspireVHomeScreenController());
  }
}
