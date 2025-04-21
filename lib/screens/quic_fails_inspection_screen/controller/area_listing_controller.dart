import 'package:get/get.dart';
import '../../../commons/common_widgets/base_widgets.dart';

class AreasControllerNew extends BaseController {
  // // Inside and Outside area lists with dummy data
  // List<String> insideAreasList = ["Dining Room", "Hallway", "Foyer", "Pantry", "Laundry Room","Mudroom","Attic","Home Office","Library","walk-in Closet","Storage Room","Other"];
  // List<String> outsideAreasList = ["Front Yard", "Backyard", "Porch", "Patio","Deck","Balcony","Terrance","Garden","Courtyard","Driveway","Garage","Carport","Side Yard","Gazebo/Pergola","Outdoor Kitchen","Fire Pit Area","Other"];
  // Inside and Outside areas mapped to their details
  final Map<String, AreaItem> insideAreas = {
    "Dining Room": AreaItem(
        baseName: "Dining Room",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Lighting - interior",
          "Furniture Condition",
          "Wall Paint & Wallpaper",
          "Flooring Condition"
        ]),
    "Hallway": AreaItem(
        baseName: "Hallway",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Lighting - interior",
          "Wall - interior",
          "Floor Condition",
          "Safety Measures"
        ]),
    "Foyer": AreaItem(
        baseName: "Foyer",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Pantry": AreaItem(
        baseName: "Pantry",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Laundry Room": AreaItem(
        baseName: "Laundry Room",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Mudroom": AreaItem(
        baseName: "Mudroom",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Attic": AreaItem(
        baseName: "Attic",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Home Office": AreaItem(
        baseName: "Home Office",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Storage Room": AreaItem(
        baseName: "Storage Room",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Library": AreaItem(
        baseName: "Library",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Walk-in Closet": AreaItem(
        baseName: "Walk-in Closet",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
    "Other": AreaItem(
        baseName: "Other",
        areaType: "Inside",
        count: 0,
        expanded: false.obs,
        details: [
          "Shelving & Storage",
          "Temperature & Ventilation",
          "Pest Control"
        ]),
  };

  final Map<String, AreaItem> outsideAreas = {
    "Front Yard": AreaItem(
        baseName: "Front Yard",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Lawn Condition", "Sprinkler System", "Fencing & Gates"]),
    "Backyard": AreaItem(
        baseName: "Backyard",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: [
          "Deck/Patio Condition",
          "Garden Maintenance",
          "Outdoor Lighting"
        ]),
    "Porch": AreaItem(
        baseName: "Porch",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Deck": AreaItem(
        baseName: "Deck",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Balcony": AreaItem(
        baseName: "Balcony",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Terrance": AreaItem(
        baseName: "Terrance",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Garden": AreaItem(
        baseName: "Garden",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Courtyard": AreaItem(
        baseName: "Courtyard",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Driveway": AreaItem(
        baseName: "Driveway",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Garage": AreaItem(
        baseName: "Garage",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Carport": AreaItem(
        baseName: "Carport",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Side Yard": AreaItem(
        baseName: "Side Yard",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Gazebo/Pergola": AreaItem(
        baseName: "Gazebo/Pergola",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Outdoor Kitchen": AreaItem(
        baseName: "Outdoor Kitchen",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Fire Pit Area": AreaItem(
        baseName: "Fire Pit Area",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
    "Other": AreaItem(
        baseName: "Other",
        areaType: "Outside",
        count: 0,
        expanded: false.obs,
        details: ["Door Mechanism", "Storage Space", "Ventilation"]),
  };

// Method to add selected area to areas list
  void addSelectedArea(String areaName, String type) {
    final selectedArea =
        (type == "Inside" ? insideAreas[areaName] : outsideAreas[areaName]);

    if (selectedArea != null) {
      // Ensure it's not already added
      bool areaExists = areas.any((area) => area.baseName == areaName);

      if (!areaExists) {
        areas.add(AreaItem(
          baseName: selectedArea.baseName,
          areaType: selectedArea.areaType,
          expanded: false.obs,
          count: 1,
          // Initial count after selection
          details: selectedArea.details,
        ));
        update(); // Refresh UI
      }
    }
  }

  // #1. Areas list with default values
  final areas = <AreaItem>[
    AreaItem(
      baseName: 'Living Room',
      areaType: 'Inside',
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
      areaType: 'Inside',
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
      areaType: 'Inside',
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
      areaType: 'Inside',
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
      areaType: 'Inside',
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

  // #2. Toggle expand method
  void toggleExpand(int index) {
    areas[index].expanded.toggle();
  }

  void uncollapseAll() {
    for (var area in areas) {
      area.expanded.value = true;
    }
    update(); // Notify UI to rebuild
  }

  // #4. Add another area method
  void addAnotherArea(int index, String type) {
    final existingArea = areas[index];

    // Find all areas of the same type
    final sameTypeAreas =
        areas.where((area) => area.baseName == existingArea.baseName).toList();

    // Get the highest count among existing areas of the same type
    int highestCount = sameTypeAreas
        .map((area) => area.count.value)
        .reduce((a, b) => a > b ? a : b);

    // Add a new instance with an incremented count
    areas.insert(
      index + 1,
      AreaItem(
        baseName: existingArea.baseName,
        areaType: type,
        expanded: false.obs,
        count: highestCount + 1,
        // Ensure unique numbering
        details: existingArea.details, // Copy the same details
      ),
    );
  }
}

// ✅ Updated `AreaItem` Model with `details` List
class AreaItem {
  final String baseName;
  final RxBool expanded;
  final RxInt count;
  final List<String> details; // Each area has a list of items
  final String areaType;

  AreaItem({
    required this.baseName,
    required this.expanded,
    required int count,
    required this.details,
    required this.areaType, // Ensure details are initialized
  }) : count = count.obs;

  // Generate the display name with count
  String get name => count.value > 1 ? '$baseName ${count.value}' : baseName;
}
