// areas_binding.dart
import 'package:get/get.dart';

import '../controller/quickPassInspection_UnitScreenController.dart';



class InspireVQuickPassUnitScreenBinding extends  Bindings {
  @override
  void dependencies() {



    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<InspireVQuickPassUnitScreenController>(() => InspireVQuickPassUnitScreenController());
  }
}
