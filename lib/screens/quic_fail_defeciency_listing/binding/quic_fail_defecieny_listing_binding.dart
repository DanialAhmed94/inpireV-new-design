// areas_binding.dart
import 'package:get/get.dart';

import '../controller/quic_fail_defeciency_listing_controller.dart';





class DeficiencyListingBinding extends  Bindings {
  @override
  void dependencies() {



    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<DeficiencyListingController>(() => DeficiencyListingController());
  }
}
