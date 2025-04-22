// areas_binding.dart
import 'package:get/get.dart';

import '../controller/unitScreen_controller.dart';


class InspireVUnitScreenBinding extends  Bindings {
  @override
  void dependencies() {



    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<InspireVUnitScreenController>(() => InspireVUnitScreenController());
  }
}
