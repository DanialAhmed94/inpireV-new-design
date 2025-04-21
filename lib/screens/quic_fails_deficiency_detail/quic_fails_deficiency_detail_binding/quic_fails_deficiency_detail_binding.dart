// areas_binding.dart
import 'package:get/get.dart';

import '../quic_fails_deficiency_detail_controller/QF_deficiency_detail_controller.dart';



class QuickFailsDeficiencyDetailBinding extends  Bindings {
  @override
  void dependencies() {


    // Lazy-load the AreasController when this route is first accessed
    Get.lazyPut<QuickFailsDeficiencyDetailController>(() => QuickFailsDeficiencyDetailController());
  }
}
