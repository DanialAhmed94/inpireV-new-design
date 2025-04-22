import 'package:get/get.dart';

import '../../../../commons/common_widgets/base_widgets.dart';

class InspireVUnitDeficiencyScreenController extends BaseController {
  late String areaName;
  //late String areaType;
  late String detail;

  // 1) Define your deficiencyList normally
  List<String> deficiencyList = [
    "Food Storage space is not present",
    "Storage Component: is damaged, nonrepairable, or missing"
  ];

  // 2) Define deficiencyCompleted here, but don't assign it in the class body
  late List<bool> deficiencyCompleted;

  @override
  void onInit() {
    super.onInit();

    // 3) Now you can initialize deficiencyCompleted
    deficiencyCompleted = List.generate(deficiencyList.length, (index) => false);

    // 4) Check any arguments
    if (Get.arguments != null) {
      areaName = Get.arguments['areaName'];
    //  areaType = Get.arguments['areaType'];
      detail = Get.arguments['detail'];
      print('Area: $areaName, Detail: $detail');

      // If returning from detail with an index to mark complete:
      if (Get.arguments['deficiencyIndex'] != null) {
        int idx = Get.arguments['deficiencyIndex'];
        deficiencyCompleted[idx] = true;
      }
    }

    update(); // 5) Finally, call update() to refresh UI
  }
}


