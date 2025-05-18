// // areas_binding.dart
// import 'package:get/get.dart';
//
// import '../controller/unitScreen_controller.dart';
//
//
// class InspireVUnitScreenBinding extends  Bindings {
//   @override
//   void dependencies() {
//
//
//
//     // Lazy-load the AreasController when this route is first accessed
//     Get.lazyPut<InspireVUnitScreenController>(() => InspireVUnitScreenController(),fenix: true);
//   }
// }
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/unitScreen_controller.dart';

class InspireVUnitScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<InspireVUnitScreenController>(InspireVUnitScreenController(), permanent: true);
  }
}
