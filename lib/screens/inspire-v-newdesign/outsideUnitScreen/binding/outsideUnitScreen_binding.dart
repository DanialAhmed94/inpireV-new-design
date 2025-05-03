// areas_binding.dart
import 'package:get/get.dart';

import '../controller/outsideUnitScreen_controller.dart';




class InspireVOutsideUnitScreenBinding extends  Bindings {
  @override
  void dependencies() {



    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<InspireVOutsideUnitScreenController>(() => InspireVOutsideUnitScreenController());
  }
}
