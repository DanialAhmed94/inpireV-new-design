// areas_binding.dart
import 'package:get/get.dart';

import '../controller/insideUnitScreen_controller.dart';



class InspireVInsideUnitScreenBinding extends  Bindings {
  @override
  void dependencies() {



    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<InspireVInsideUnitScreenController>(() => InspireVInsideUnitScreenController());
  }
}
