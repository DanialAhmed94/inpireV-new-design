import 'package:get/get.dart';

import '../controller/amenitiesScreen_controller.dart';


class InspireVAmenitiesScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InspireVAmenitiesScreenController>(InspireVAmenitiesScreenController());
  }
}
