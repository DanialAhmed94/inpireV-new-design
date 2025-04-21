import 'package:get/get.dart';

import '../controller/inpirev_welcomeScreen_controller.dart';


class InspireVSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InspireVSelectionController>(InspireVSelectionController());
  }
}
