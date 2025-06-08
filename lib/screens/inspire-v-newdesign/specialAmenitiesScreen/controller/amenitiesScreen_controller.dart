// controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_housing/screens/inspire-v-newdesign/homeScreen/screen/inpireV-homeScreen.dart';

import '../../../../commons/common_widgets/base_widgets.dart';
import '../../homeScreen/controller/inpireV_home_controller.dart';
import '../../quickPassInspectionSummary/screen/quickPassInspectionSummary_screen.dart';

class InspireVAmenitiesScreenController extends BaseController {
  RxBool isDisabilityAccessible = false.obs;
  final TextEditingController disabilityController = TextEditingController();
  RxString disabilityText = ''.obs;

  final List<String> inspectionTypes = [
    'Unknown',
    'Apartments',
    'Condominium',
    'Cooperative',
    'Double',
    'Duplex ',
    'Flat',
    'Highrise',
    'House',
    'Loft',
    'Mobile Home',
    'Mobile Home Park',
    'Modular or Manufactured',
    'Multi Family Flat ',
    'Quaduplex',
    'Single Room Occupancy',
    'Shared Housing/Room to Rent',
    'Studio/Efficiency',
    'Townhouse',
    'Triplex',
    'Villa',
  ];
  String? selectedUnitType;
  final unitSizeeController = TextEditingController();
  final unitAgeController = TextEditingController();

  InspireVAmenitiesScreenController() {
    disabilityController.addListener(() {
      disabilityText.value = disabilityController.text.trim();
    });
  }

  @override
  void onClose() {
    disabilityController.dispose();

    for (final section in sections) {
      section.otherController.dispose();
    }

    super.onClose();
  }

  final List<AmenitySection> sections = <AmenitySection>[
    AmenitySection(
        title: "Living Room",
        options: [
          AmenityOption("Balcony, patio, deck, porch"),
          AmenityOption("Exceptional size relative to needs of family"),
          AmenityOption("High quality floors or wall coverings"),
          AmenityOption("Special windows or doors"),
          AmenityOption("Working fireplace or stove"),
        ],
        isExpanded: true),
    AmenitySection(title: "Kitchen", options: [
      AmenityOption("Abundant counter-top space"),
      AmenityOption("Dishwasher"),
      AmenityOption("Double sink"),
      AmenityOption("Double oven/self cleaning oven, microwave"),
      AmenityOption("Eating counter/breakfast nook"),
      AmenityOption("Exceptional size relative to needs of family"),
      AmenityOption("Garbage disposal"),
      AmenityOption("High quality cabinets"),
      AmenityOption("Modern appliance(s)"),
      AmenityOption("Separate freezer"),
    ]),
    AmenitySection(title: "Other rooms used for living", options: [
      AmenityOption("Balcony, patio, deck, porch"),
      AmenityOption("Exceptional size relative to needs of family"),
      AmenityOption("High quality floors or wall coverings"),
      AmenityOption("Special windows or doors"),
      AmenityOption("Working fireplace or stove"),
    ]),
    AmenitySection(title: "Bathroom", options: [
      AmenityOption("Built-in heat lamp"),
      AmenityOption("Double sink or special lavatory"),
      AmenityOption("Exceptional size relative to needs of family"),
      AmenityOption("Glass door on shower/tub"),
      AmenityOption("Large mirrors"),
      AmenityOption("Separate dressing room"),
      AmenityOption("Special feature shower head"),
    ]),
    AmenitySection(title: "Overall Characteristics", options: [
      AmenityOption("Central A/C"),
      AmenityOption("Driveway"),
      AmenityOption("Garage"),
      AmenityOption("Good maintenance of building exterior"),
      AmenityOption(
          "Good upkeep of grounds (i.e., site cleanliness, landscaping)"),
      AmenityOption("Large yard"),
      AmenityOption("Miniblinds"),
      AmenityOption(
          "Other forms of weatherization (e.g., insulation, weather, stripping)"),
      AmenityOption("Parking Facilities"),
      AmenityOption("Pest Control"),
      AmenityOption("Screen doors or windows"),
      AmenityOption("Storm windows and doors"),
      AmenityOption("Wall A/C"),
    ]),
    AmenitySection(title: "Disabled Accessibility", options: [
      AmenityOption("32¨ Doors"),
      AmenityOption("Flat Entry"),
      AmenityOption("Ramped Entry "),
    ]),
  ];

  void toggleOption(int sectionIndex, String label, bool value) {
    final option =
        sections[sectionIndex].options.firstWhere((e) => e.label == label);
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

  void onSvaveAminties() {

    debugPrint("onSave Aminites tapped");
    final controller = Get.find<InspireVHomeScreenController>();
    final completedInspection = controller.currentInspection.value;
    debugPrint("${completedInspection?.tenantName ?? ""}");
    if (completedInspection != null) {
      debugPrint("onSave Aminites tapped 1");

      controller.completedInspections.add(CompletedInspectionItem(
        address: completedInspection.address,
        location: completedInspection.address,
        date: completedInspection.date,
        tagLabel: completedInspection.tagLabel,
        tenantName: completedInspection.tenantName,
        timeRange: completedInspection.timeRange
      ));
      controller.currentInspection.value = null; // Clear the temp inspection
      Get.toNamed(InspireVHomeScreen.routes);

    }
  }

  // For Utilities/Amenities Section
  final utilitiesOptions = <AmenityOption>[
    AmenityOption("Cable Television"),
    AmenityOption("Electric"),
    AmenityOption("Gas"),
    AmenityOption("High Speed Internet"),
    AmenityOption("Sewer"),
    AmenityOption("Trash Pick Up"),
    AmenityOption("Water"),
  ].obs;

  final applianceOptions = <AmenityOption>[
    AmenityOption("Ceiling Fan"),
    AmenityOption("Dryer"),
    AmenityOption("Microwave"),
    AmenityOption("Refrigerator"),
    AmenityOption("Washer"),
    AmenityOption("Other Electric"),
  ].obs;

  final amenityOptions = <AmenityOption>[
    AmenityOption("Co-Working Space"),
    AmenityOption("Gardens"),
    AmenityOption("Laundry"),
    AmenityOption("Parking"),
    AmenityOption("Parks"),
    AmenityOption("Playgrounds"),
  ].obs;

  final neighborhoodOptions = <AmenityOption>[
    AmenityOption("Community Centers"),
    AmenityOption("Groceries Stores"),
    AmenityOption("Healthcare"),
    AmenityOption("Library"),
    AmenityOption("Pharmacies"),
    AmenityOption("Public Transport"),
    AmenityOption("Schools"),
    AmenityOption("Sport Fields"),
    AmenityOption("Squares"),
  ].obs;

// For Condition/Maintenance Section
  final constructionQuality = "Really Bad".obs;
  final constructionQualityOptions = [
    "Very good",
    "Good",
    "Regular",
    "Bad",
    "Really Bad"
  ];

  final maintenanceCondition = "Regular".obs;
  final maintenanceConditionOptions = [
    "Very good",
    "Good",
    "Regular",
    "Bad",
    "Really Bad"
  ];
  final systemOptions = <SystemOption>[
    SystemOption(
      label: "Heating System",
      fuelOptions: ["Natural Gas", "Bottled Gas", "Oil", "Electric"],
    ),
    SystemOption(
      label: "Stove",
      fuelOptions: ["Natural Gas", "Bottled Gas", "Oil", "Electric"],
    ),
    SystemOption(
      label: "Water Heating",
      fuelOptions: ["Natural Gas", "Bottled Gas", "Oil", "Electric"],
    ),
  ].obs;
}

class SystemOption {
  final String label;
  final RxBool isChecked;
  final RxString selectedFuel;
  final List<String> fuelOptions;

  SystemOption({
    required this.label,
    bool isChecked = false,
    String selectedFuel = '',
    required this.fuelOptions,
  })  : isChecked = isChecked.obs,
        selectedFuel = selectedFuel.obs;
}

class AmenitySection {
  final String title;
  final List<AmenityOption> options;
  bool isExpanded;
  final TextEditingController otherController;
  bool otherChecked;

  AmenitySection({
    required this.title,
    required this.options,
    this.isExpanded = false,
    TextEditingController? otherController,
    this.otherChecked = false,
  }) : otherController = otherController ?? TextEditingController();
}

class AmenityOption {
  final String label;
  bool isChecked;

  AmenityOption(this.label, {this.isChecked = false});
}
