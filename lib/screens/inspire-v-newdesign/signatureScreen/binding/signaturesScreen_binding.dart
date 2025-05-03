import 'package:get/get.dart';

import '../controller/signaturesScreen_controller.dart';

class InspireVSignatureBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InspireVSignatureController>(InspireVSignatureController());
  }
}
