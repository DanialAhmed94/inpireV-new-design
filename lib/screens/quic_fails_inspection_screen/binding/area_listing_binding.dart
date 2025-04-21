// areas_binding.dart
import 'package:get/get.dart';

import '../controller/area_listing_controller.dart';

class AreasBinding extends  Bindings {
  @override
  void dependencies() {



    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<AreasControllerNew>(() => AreasControllerNew());
  }
}
