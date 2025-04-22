// areas_binding.dart
import 'package:get/get.dart';

import '../controller/unitDeficiencyScreen_controller.dart';






class InspireVUnitDeficiencyScreenBinding extends  Bindings {
  @override
  void dependencies() {



    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<InspireVUnitDeficiencyScreenController>(() => InspireVUnitDeficiencyScreenController());
  }
}
