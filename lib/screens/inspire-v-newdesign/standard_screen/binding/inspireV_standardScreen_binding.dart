import 'package:get/get.dart';

import '../controller/inpireV_standardScreen_controller.dart';

class InspireVStandardScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InspireVStandardScreenController>(InspireVStandardScreenController());
  }
}
