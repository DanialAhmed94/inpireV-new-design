import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_housing/commons/all.dart';

import '../../../../commons/common_widgets/base_widgets.dart';
import '../../insideUnitScreen/screen/insideUnitScreen.dart';
import '../../outsideUnitScreen/screen/outsideUnitScreen.dart';
import '../../specialAmenitiesScreen/screen/amenitiesScreen_screen.dart';
import '../../unitScreen/controller/unitScreen_controller.dart';
import '../../unitScreen/screen/unitScreen.dart';

class InspireVStandardScreenController extends BaseController {

  final dummyRx = false.obs;

  void onSpecialAmenitiesTap() {
    debugPrint('onSpecialAmenitiesTaptapped');
    // TODO: Add navigation or business logic here.
    Get.toNamed(InspireVAmenitiesScreen.routes);
  }
  /// Called when the "Unit" card is tapped
  void onUnitCardTap() {
    debugPrint('Unit card tapped');
    // TODO: Add navigation or business logic here.
    Get.toNamed(InspireVUnitScreen.routes);

  }

  bool get isSpecialAmenitiesEnabled {
    final unitController = Get.find<InspireVUnitScreenController>();
    return unitController.hasCompletedDetails;
  }

  /// Called when the "Inside" card is tapped
  void onInsideCardTap() {
    debugPrint('Inside card tapped');
    // TODO: Add navigation or business logic here.
    Get.toNamed(InspireVInsideUnitScreen.routes);
  }

  /// Called when the "Outside" card is tapped
  void onOutsideCardTap() {
    debugPrint('Outside card tapped');
    // TODO: Add navigation or business logic here.

    Get.toNamed(InspireVOutsideUnitScreen.routes);

  }
  void handleBackPressed() {
    bool hasCompletedWork = Get.isRegistered<InspireVUnitScreenController>() &&
        Get.find<InspireVUnitScreenController>().hasCompletedDetails;

    if (hasCompletedWork) {
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.px),
          ),
          title: Text(
            'Inspection in process',
            style: TextStyle(
              fontSize: 20.px,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'You will lose all progress made if you go back.\nDo you want to continue?',
                style: TextStyle(
                  fontSize: 16.px,
                  color: Colors.grey.shade700,
                ),
              ),
              SizedBox(height: 24.px),
              Column(
                children: [
                  // Resume Inspection Button
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () => Get.back(),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.px),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        'Resume Inspection',
                        style: TextStyle(
                          fontSize: 16.px,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primerColor,
                        ),
                      ),
                    ),
                  ),
                  // Return and Lose Progress Button
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (Get.isRegistered<InspireVUnitScreenController>()) {
                          Get.delete<InspireVUnitScreenController>(force: true);
                        }
                        Get.back();
                        Get.back();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.px),
                        alignment: Alignment.centerLeft,
                      ),
                      child: Text(
                        'Return and lose progress',
                        style: TextStyle(
                          fontSize: 16.px,
                          fontWeight: FontWeight.w500,
                          color: Colors.red.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actionsPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.fromLTRB(24.px, 16.px, 24.px, 8.px),
          titlePadding: EdgeInsets.fromLTRB(24.px, 24.px, 24.px, 8.px),
        ),
        barrierDismissible: false,
      );
    } else {
      Get.back();
    }
  }
  // void handleBackPressed() {
  //   // Check if the Unit Controller exists and has completed details
  //   bool hasCompletedWork = Get.isRegistered<InspireVUnitScreenController>() &&
  //       Get.find<InspireVUnitScreenController>().hasCompletedDetails;
  //
  //   if (hasCompletedWork) {
  //     // Show confirmation dialog
  //     Get.dialog(
  //       AlertDialog(
  //         title: Text('Work in Progress'),
  //         content: Text('You have completed work. Moving back will delete unsaved data.'),
  //         actions: [
  //           TextButton(
  //             onPressed: () => Get.back(), // Close dialog
  //             child: Text('Cancel'),
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               // Delete the Unit Controller and navigate back
  //               if (Get.isRegistered<InspireVUnitScreenController>()) {
  //                 Get.delete<InspireVUnitScreenController>(force: true);
  //               }
  //               Get.back(); // Close dialog
  //               Get.back(); // Navigate back
  //             },
  //             child: Text('Proceed', style: TextStyle(color: Colors.red)),
  //           ),
  //         ],
  //       ),
  //       barrierDismissible: false,
  //     );
  //   } else {
  //     Get.back(); // No completed work, proceed with back
  //   }
  // }
}
