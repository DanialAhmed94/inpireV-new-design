// controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/common_widgets/base_widgets.dart';
import '../../quickPassInspectionSummary/screen/quickPassInspectionSummary_screen.dart';

class InspireVAmenitiesScreenController extends BaseController {
  RxBool isDisabilityAccessible = false.obs;
  final TextEditingController disabilityController = TextEditingController();
  RxString disabilityText = ''.obs;


  InspireVAmenitiesScreenController() {
    disabilityController.addListener(() {
      disabilityText.value = disabilityController.text.trim();
    });
  }
  @override
  void onClose() {
    disabilityController.dispose();
    super.onClose();
  }

  final List<AmenitySection> sections = <AmenitySection>[
    AmenitySection(title: "Living Room", options: [
      AmenityOption("High quality floors or wall coverings"),
      AmenityOption("Working fireplace or stove"),
      AmenityOption("Balcony, patio, deck, porch"),
      AmenityOption("Special windows or doors"),
      AmenityOption("Exceptional size relative to needs of family"),
    ], isExpanded: true),

    AmenitySection(title: "Kitchen", options: [
      AmenityOption("Modern cabinets"),
      AmenityOption("Granite countertops"),
    ]),

    AmenitySection(title: "Other rooms used for living", options: [
      AmenityOption("Recreation room"),
      AmenityOption("Home office"),
    ]),

    AmenitySection(title: "Bath", options: [
      AmenityOption("Jacuzzi tub"),
      AmenityOption("Walk-in shower"),
    ]),

    AmenitySection(title: "Overall Characteristics", options: [
      AmenityOption("Energy efficient"),
      AmenityOption("Recently renovated"),
    ]),

    AmenitySection(title: "Disabled Accessibility", options: [
      AmenityOption("Wheelchair ramp"),
      AmenityOption("Wide doorways"),
    ]),
  ];

  void toggleOption(int sectionIndex, String label, bool value) {
    final option = sections[sectionIndex].options.firstWhere((e) => e.label == label);
    option.isChecked = value;
    update();
  }

  void toggleSection(int index, bool expanded) {
    sections[index].isExpanded = expanded;
    update();
  }

  void toggleDisabilityAccess(bool val) {
    isDisabilityAccessible.value = val;
  }
  void onSpecialAminitiesTap() {
    debugPrint('Unit card tapped');
    // TODO: Add navigation or business logic here.
    Get.toNamed(QPInspireVInspectionSummaryScreen.routes);
  }
}

class AmenitySection {
  final String title;
  final List<AmenityOption> options;
  bool isExpanded;

  AmenitySection({
    required this.title,
    required this.options,
    this.isExpanded = false,
  });
}

class AmenityOption {
  final String label;
  bool isChecked;

  AmenityOption(this.label, {this.isChecked = false});
}
