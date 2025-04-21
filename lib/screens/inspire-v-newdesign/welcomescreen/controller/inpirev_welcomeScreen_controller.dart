import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:public_housing/commons/all.dart';

// Import your route destinations (adjust paths as needed)
import '../../../../screens/auth/signing_screen/screen/signing_screen.dart';
import '../../homeScreen/screen/inpireV-homeScreen.dart';

/// Controller for the selection screen where users choose between
/// the standard NSPIRE or NSPIRE – V flows.
class InspireVSelectionController extends BaseController {
  /// Holds the current user's name. Replace with real data as needed.
  final userName = 'Matt'.obs;

  @override
  void onInit() {
    super.onInit();

  }

  /// Navigate to the standard NSPIRE flow
  void onNspireTap() {
    //Get.toNamed(SigningScreen.routes);
  }

  /// Navigate to the NSPIRE – V flow
  void onNspireVTap() {
    Get.toNamed(InspireVHomeScreen.routes);
  }

  @override
  void onClose() {
    // Clean up any resources if needed
    super.onClose();
  }
}
