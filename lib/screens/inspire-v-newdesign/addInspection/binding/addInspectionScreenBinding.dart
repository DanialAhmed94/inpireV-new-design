import 'package:get/get.dart';

import '../controller/addInspectionScreenController.dart';

class InspireVAddInspectionScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InspireVAddInspectionScreenController>(InspireVAddInspectionScreenController());
  }
}
