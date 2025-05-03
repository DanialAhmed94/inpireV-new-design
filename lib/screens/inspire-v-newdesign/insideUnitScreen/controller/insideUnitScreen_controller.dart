import 'package:get/get.dart';
import '../../../../commons/common_widgets/base_widgets.dart';

class InspireVInsideUnitScreenController extends BaseController {
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
      baseName: 'Electrical Rooms',
      expanded: false.obs,
      count: 1,
      details: [
        "Bathtub and Shower Standard",
        "Call-for-Aid System Standard",
        "Cabinet and Storage",
        "Ceiling Standard",
        "Chimney Standard",
        "Clothes Dryer Exhaust Ventilation Standard",
        "Door – Entry Standard",
        "Door – Fire Labeled Standard",
        "Door – General Standard",
        "Drain Standard",
        "Egress Standard",
        "Electrical – GFCI or AFCI – Outlet or Breaker Standard",
        "Electrical – Service Panel Standard",
        "Elevator Standard",
        "Exit Sign Standard",
        "Fire Extinguisher Standard",
        "Flammable and Combustible Item Standard",
        "Floor Standard",
        "Foundation Standard",
        "Garage Door Standard",
        "Grab Bar Standard",
        "Handrail Standard",
        "Guardrail Standard",
        "Heating, Ventilation, and Air Conditioning (HVAC) Standard",
        "Infestation Standard",
        "Leak – Gas or Oil",
        "Leak – Sewage System",
        "Lighting – Auxiliary Standard",
        "Lighting – Interior Standard",
        "Litter Standard",
        "Mold-Like Substance Standard",
        "Potential Lead-Based Paint Hazards – Visual Assessment Standard",
        "Refrigerator Standard",
        "Sharp Edges Standard",
        "Sink Standard",
        "Smoke Alarm Standard",
        "Sprinkler Assembly Standard",
        "Steps and Stairs Standard",
        "Structural System Standard",
        "Toilet Standard",
        "Trash Chute Standard",
        "Trip Hazard Standard",
        "Ventilation",
        "Wall – Interior Standard",
        "Window Standard",

      ],
    ),
    AreaItem(
      baseName: 'Elevators',
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
      baseName: 'Emergency Corridors',
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
      baseName: 'Indoor Recreational Areas',
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
      baseName: 'Indoor Trash Rooms',
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
    AreaItem(
      baseName: 'Main Interior Entrances',
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
    AreaItem(
      baseName: 'Maintenance Rooms',
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
    AreaItem(
      baseName: 'Mechanical Rooms',
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
    AreaItem(
      baseName: 'Shared Laundry Rooms',
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
    AreaItem(
      baseName: 'Shared Storage Rooms',
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
    AreaItem(
      baseName: 'Stairwells',
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
    AreaItem(
      baseName: 'Community Rooms',
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
    AreaItem(
      baseName: 'Interior Hallways',
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
    AreaItem(
      baseName: 'Lobbies',
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
    AreaItem(
      baseName: 'Mail Rooms',
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

  AreaItem({
    required this.baseName,
    required this.expanded,
    required int count,
    required this.details,
  }) : count = count;

  /// Display name, appending count if >1
  String get name => count > 1 ? '$baseName $count' : baseName;
}



