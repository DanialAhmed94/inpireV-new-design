import 'package:get/get.dart';

import '../controller/quickPassInspectionSummary_controller.dart';


class InspireVInspectionSummaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<QPInspireVInspectionSummaryController>(QPInspireVInspectionSummaryController());
  }
}
