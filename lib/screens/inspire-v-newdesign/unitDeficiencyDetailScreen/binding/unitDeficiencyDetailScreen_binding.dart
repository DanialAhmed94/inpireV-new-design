// areas_binding.dart
import 'package:get/get.dart';

import '../controller/unitDeficiencyDetailScreen_controller.dart';




class InpireVUnitDeficiencyDetailBinding extends  Bindings {
  @override
  void dependencies() {


    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<InpireVUnitDeficiencyDetailScontroller>(() => InpireVUnitDeficiencyDetailScontroller());
  }
}
