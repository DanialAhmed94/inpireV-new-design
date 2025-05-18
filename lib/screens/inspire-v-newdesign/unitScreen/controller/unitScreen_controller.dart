import 'package:get/get.dart';
import '../../../../commons/common_widgets/base_widgets.dart';

class InspireVUnitScreenController extends BaseController {


  //test
  final RxMap<String, bool> completedDetails = <String, bool>{}.obs;

  // void markDetailCompleted(String areaName) {
  //   completedDetails[areaName] = true;
  //   completedDetails.refresh(); // Trigger Obx reactivity
  // }

  void markDetailCompleted(String areaName,) {
    print('Marking detail completed for: $areaName'); // Add this

    completedDetails['$areaName'] = true;
    update();
  }

// Inside InspireVUnitScreenController
  bool get hasCompletedDetails =>
      completedDetails.values.any((isCompleted) => isCompleted);

  /// #0. Dummy list of selectable area items
  final availableAreas = <AreaItem>[
    AreaItem(
      baseName: 'Appliances',
      expanded: false.obs,
      count: 1,
      details: [
        'Lighting - interior',
        'Furniture Condition',
        'Wall Paint & Wallpaper',
        'Flooring Condition',
      ],
    ),
    AreaItem(
      baseName: 'Carbon Monoxide Detectors',
      expanded: false.obs,
      count: 1,
      details: [
        'Lighting - interior',
        'Wall - interior',
        'Floor Condition',
        'Safety Measures',
      ],
    ),
    AreaItem(
      baseName: 'Ceiling',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Closet',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Dining Area',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Electrical Outlets and Switches',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Entry Door (unit)',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Floor',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Hallways (inside the unit)',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'HVAC (heating, ventilation, and AC Units)',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Interior Doors',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Laundry Area',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Light Fixures',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Smoke Detectors',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Walls',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),
    AreaItem(
      baseName: 'Others',
      expanded: false.obs,
      count: 1,
      details: [
        'Shelving & Storage',
        'Temperature & Ventilation',
        'Pest Control',
      ],
    ),


  ].obs;

  /// #1. Areas list with default values
  final areas = <AreaItem>[
    AreaItem(
      baseName: 'Living Room',
      expanded: false.obs,
      count: 1,
      details: [
        "Lighting - interior",
        "Minimum Electrical and Lighting",
        "Carbon Monoxide Alarm",
        "Smoke Alarm",
        "Ceiling",
        "Wall - interior",
        "Floor",
        "Window",
        "Door - General",
        "Electrical - conductor, outlet, and switch",
        "Electrical - GFCI or AFCI - outlet or breaker",
        "Electrical - service panel",
        "Heating, ventilation, and air conditioning...",
      ],
    ),
    AreaItem(
      baseName: 'Kitchen',
      expanded: false.obs,
      count: 1,
      details: [
        "Cooking Appliance",
        "Refrigerator",
        "Cabinet and Storage",
        "Sink",
        "Leak - water",
        "Food Preparation Area",
        "Lighting - interior",
        "Minimum Electrical and Lighting",
        "Carbon Monoxide Alarm",
        "Smoke Alarm",
        "Ceiling",
        "Wall - interior",
        "Floor",
        "Window",
        "Door - General",
        "Electrical - conductor, outlet, and switch",
        "Electrical - GFCI or AFCI - outlet or breaker",
        "Electrical - service panel",
        "Heating, ventilation, and air conditioning (HVAC)",
        "Water Heater",
        "Fire Extinguisher",
      ],
    ),
    AreaItem(
      baseName: 'Bedroom',
      expanded: false.obs,
      count: 1,
      details: [
        "Lighting - interior",
        "Minimum Electrical and Lighting",
        "Carbon Monoxide Alarm",
        "Smoke Alarm",
      ],
    ),
    AreaItem(
      baseName: 'Bathroom',
      expanded: false.obs,
      count: 1,
      details: [
        "Lighting - interior",
        "Toilet",
        "Shower/Bathtub",
        "Sink & Faucet",
        "Ventilation",
        "Plumbing Connections",
      ],
    ),
    AreaItem(
      baseName: 'Basement',
      expanded: false.obs,
      count: 1,
      details: [
        "Lighting - interior",
        "Foundation & Walls",
        "Moisture & Water Leaks",
        "Heating System",
        "Electrical Panel",
      ],
    ),
  ].obs;

  /// #2. Add selected area from the dummy list
  void addSelectedArea(AreaItem selectedArea) {
    final exists = areas.any((area) => area.baseName == selectedArea.baseName);
    if (!exists) {
      areas.add(
        AreaItem(
          baseName: selectedArea.baseName,
          expanded: false.obs,
          count: 1,
          details: selectedArea.details,
        ),
      );
      update();
    }
  }

  /// #3. Toggle expand of an area at [index]
  void toggleExpand(int index) {
    areas[index].expanded.toggle();
  }

  /// #4. Uncollapse all areas
  void uncollapseAll() {
    for (var area in areas) {
      area.expanded.value = true;
    }
    update();
  }

  /// #5. Add another instance of an existing area (incrementing count)
  void addAnotherArea(int index) {
    final existing = areas[index];
    // Find same baseName items
    final sameBase = areas.where((area) => area.baseName == existing.baseName).toList();
    // Determine highest count
    final maxCount = sameBase.map((a) => a.count).reduce((a, b) => a > b ? a : b);
    areas.insert(
      index + 1,
      AreaItem(
        baseName: existing.baseName,
        expanded: false.obs,
        count: maxCount + 1,
        details: existing.details,
      ),
    );
    update();
  }



}

/// AreaItem model without areaType
class AreaItem {
  final String baseName;
  final RxBool expanded;
  final int count;
  final List<String> details;

  //test
  RxBool hasCompletedDetails = false.obs;

  AreaItem({
    required this.baseName,
    required this.expanded,
    required int count,
    required this.details,
  }) : count = count;

  /// Display name, appending count if >1
  String get name => count > 1 ? '$baseName $count' : baseName;
}



