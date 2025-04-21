import 'package:get/get.dart';

import '../controller/inpireV_loginController.dart';

class InspireVSigningBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<InspireVSigningController>(InspireVSigningController());
  }
}
