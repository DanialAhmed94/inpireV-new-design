import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/common_widgets/base_widgets.dart';
import '../../unitScreen/screen/unitScreen.dart';

class InspireVStandardScreenController extends BaseController {
  /// Called when the "Unit" card is tapped
  void onUnitCardTap() {
    debugPrint('Unit card tapped');
    // TODO: Add navigation or business logic here.
    Get.toNamed(InspireVUnitScreen.routes);
  }

  /// Called when the "Inside" card is tapped
  void onInsideCardTap() {
    debugPrint('Inside card tapped');
    // TODO: Add navigation or business logic here.
  }

  /// Called when the "Outside" card is tapped
  void onOutsideCardTap() {
    debugPrint('Outside card tapped');
    // TODO: Add navigation or business logic here.
  }
}
