import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_housing/commons/all.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../unitDeficiencyScreen/screen/unitDeficiencyScreen.dart';
import '../controller/unitScreen_controller.dart';
import '../widgets/expandableCard_unitScreen.dart';

class InspireVUnitScreen extends GetView<InspireVUnitScreenController> {
  const InspireVUnitScreen({Key? key}) : super(key: key);
  static const String routes = '/UnitScreenAreas';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InspireVUnitScreenController>(
      init: InspireVUnitScreenController(),
      assignId: true,
      builder: (controller) {
        return BaseScreen(
          backgroundColor: controller.appColors.appBGColor,
          child: SafeArea(
            child: Column(
              children: [
                // Common App Bar (Fixed, Not Inside ScrollView)
                CommonAppBar(
                  color: controller.appColors.transparent,
                  radius: 0.px,
                  onClickBack: () => Get.back(),
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 32.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Title
                        Center(
                          child: MyTextView(
                            "Avalon Gardens - 422047",
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.appColor,
                              textWeight: FontWeight.w600,
                              textFamily: fontFamilyBold,
                              textSize: 32.px,
                            ),
                          ).paddingOnly(
                              top: 24.px,
                              left: 32.px,
                              right: 32.px,
                              bottom: 32.px),
                        ),

                        // Buttons Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonButton(
                              title: Strings.UncollapseAll,
                              border: Border.all(
                                  color: controller.appColors.appColor),
                              radius: 100.px,
                              width: 198.px,
                              height: 47.px,
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.px, horizontal: 24.px),
                              textSize: 16.px,
                              textWeight: FontWeight.w500,
                              textFamily: fontFamilyRegular,
                              textColor: controller.appColors.appColor,
                              color: controller.appColors.transparent,
                              onTap: controller.uncollapseAll,
                            ),
                            CommonIconButton(
                              title: Strings.addArea,
                              radius: 100.px,
                              width: 191.px,
                              height: 44.px,
                              color: controller.appColors.appColor,
                              padding: EdgeInsets.symmetric(horizontal: 24.px),
                              textSize: 16.px,
                              textWeight: FontWeight.w500,
                              textFamily: fontFamilyRegular,
                              onTap: () => showAddAreaDialog(),
                              // Add new area (default)
                              iconColor: controller.appColors.white,
                              icon: addIcon,
                              iconheigth: 20.px,
                            ).paddingOnly(
                                left: 32.px, right: 32.px, bottom: 10.px),
                          ],
                        ).paddingOnly(left: 32.px, right: 32.px, bottom: 32.px),

                        // List of Expandable Areas in Two Columns
                        Obx(() {
                          // Split the indices into two groups (left/right)
                          final leftIndices = <int>[];
                          final rightIndices = <int>[];

                          for (var i = 0; i < controller.areas.length; i++) {
                            if (i % 2 == 0) {
                              leftIndices.add(i);
                            } else {
                              rightIndices.add(i);
                            }
                          }

                          return SingleChildScrollView(
                            padding: EdgeInsets.symmetric(horizontal: 32.px),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left column
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: List.generate(
                                            leftIndices.length, (columnIndex) {
                                          final actualIndex =
                                              leftIndices[columnIndex];
                                          final area =
                                              controller.areas[actualIndex];

                                          return Container(
                                            // Vertical spacing between cards
                                            margin:
                                                EdgeInsets.only(bottom: 16.px),
                                            child: UnitScreenExpandableRoomCard(
                                              // 1. NEW: When a detail is tapped, navigate
                                              onItemTap: (detailSelected) {
                                                Get.toNamed(
                                                  InspireVUnitDeficiencyScreen.routes, // or your route
                                                  arguments: {
                                                    'areaName': area.name,

                                                    'detail': detailSelected,
                                                  },
                                                );
                                              },
                                              // areaType: area.areaType,
                                              details: area.details,
                                              areaName: area.name,
                                              isExpanded: area.expanded.value,
                                              onToggle: () => controller
                                                  .toggleExpand(actualIndex),
                                              onAdd: () => controller
                                                  .addAnotherArea(actualIndex),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),

                                    // Horizontal gap between columns
                                    SizedBox(width: 16.px),

                                    // Right column
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: List.generate(
                                            rightIndices.length, (columnIndex) {
                                          final actualIndex =
                                              rightIndices[columnIndex];
                                          final area =
                                              controller.areas[actualIndex];

                                          return Container(
                                            margin:
                                                EdgeInsets.only(bottom: 16.px),
                                            child: UnitScreenExpandableRoomCard(
                                              // 1. NEW: When a detail is tapped, navigate
                                              onItemTap: (detailSelected) {
                                                Get.toNamed(
                                                  InspireVUnitDeficiencyScreen.routes, // or your route
                                                  arguments: {
                                                    'areaName': area.name,

                                                    'detail': detailSelected,
                                                  },
                                                );
                                              },
                                              //areaType: area.areaType,
                                              details: area.details,
                                              areaName: area.name,
                                              isExpanded: area.expanded.value,
                                              onToggle: () => controller
                                                  .toggleExpand(actualIndex),
                                              onAdd: () =>
                                                  controller.addAnotherArea(
                                                actualIndex,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonButton(
                                      title: Strings.inspectionSummary,
                                      textColor: AppColors().border1,
                                      // Always gray text
                                      color:
                                          AppColors().black.withOpacity(0.12),
                                      // Always “disabled” background
                                      radius: 35.px,
                                      textWeight: FontWeight.w600,
                                      textSize: 16.px,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 24.px,
                                        vertical: 12.px,
                                      ),
                                      onTap: () {
                                        // No controller logic here, so do nothing
                                      },
                                    ).paddingSymmetric(vertical: 48.px)
                                  ],
                                )
                              ],
                            ),
                          );
                        }),

                        // Bottom Padding to Prevent Clipping
                        SizedBox(height: 32.px),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// … other imports …

  void showAddAreaDialog() {
    String? selectedAreaName;

    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.px),
        ),
        child: Padding(
          padding: EdgeInsets.all(24.px),
          child: StatefulBuilder(builder: (context, setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: MyTextView(
                    'Add New Area',
                    textStyleNew: MyTextStyle(
                      textColor: controller.appColors.appColor,
                      textWeight: FontWeight.w600,
                      textSize: 20.px,
                    ),
                    textAlignNew: TextAlign.center,
                  ),
                ),

                SizedBox(height: 24.px),

                // Label
                MyTextView(
                  'Area',
                  textStyleNew: MyTextStyle(
                    textColor: controller.appColors.appColor,
                    textWeight: FontWeight.w500,
                    textSize: 12.px,
                  ),
                ),
                SizedBox(height: 4.px),

                // Custom dropdown trigger
                PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      selectedAreaName = value;
                    });
                  },
                  color: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.px),
                  ),
                  offset: Offset(0, 8.px),
                  itemBuilder: (ctx) => controller.availableAreas.map((area) {
                    return PopupMenuItem<String>(
                      value: area.baseName,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.px,
                          horizontal: 16.px,
                        ),
                        child: Text(area.baseName),
                      ),
                    );
                  }).toList(),
                  child: Container(
                    height: 48.px,
                    padding: EdgeInsets.symmetric(horizontal: 12.px),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.px),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedAreaName ?? 'Select an Area',
                          style: TextStyle(
                            fontSize: 14.px,
                            color: selectedAreaName == null
                                ? Colors.grey
                                : Colors.black,
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, color: Colors.grey),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 32.px),

                // Buttons
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: controller.appColors.appColor,
                          fontSize: 16.px,
                        ),
                      ),
                    ),
                    Spacer(),

                    CommonButton(
                        title: "Save",
                        onTap: selectedAreaName == null
                            ? null
                            : () {
                                final area = controller.availableAreas
                                    .firstWhere(
                                        (a) => a.baseName == selectedAreaName);
                                controller.addSelectedArea(area);
                                Get.back();
                              },
                        color: selectedAreaName == null
                            ? controller.appColors.appColor.withOpacity(0.4)
                            : controller.appColors.appColor)
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:public_housing/commons/all.dart';
//
// import '../controller/unitScreen_controller.dart';
// import '../widgets/expandableCard_unitScreen.dart';
//
//
// class InspireVUnitScreen extends GetView<InspireVUnitScreenController> {
//   const InspireVUnitScreen({Key? key}) : super(key: key);
//   static const String routes = '/UnitScreenAreas';
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<InspireVUnitScreenController>(
//       init: InspireVUnitScreenController(),
//       assignId: true,
//       builder: (controller) {
//         return BaseScreen(
//           backgroundColor: controller.appColors.appBGColor,
//           child: SafeArea(
//             child: Column(
//               children: [
//                 // Common App Bar (Fixed, Not Inside ScrollView)
//                 CommonAppBar(
//                   color: controller.appColors.transparent,
//                   radius: 0.px,
//                   onClickBack: () => Get.back(),
//                 ),
//
//                 // Scrollable Content
//                 Expanded(
//                   child: SingleChildScrollView(
//                     padding: EdgeInsets.symmetric(horizontal: 32.px),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Header Title
//                         Center(
//                           child: MyTextView(
//                             "Avalon Gardens - 422047",
//                             textStyleNew: MyTextStyle(
//                               textColor: controller.appColors.appColor,
//                               textWeight: FontWeight.w600,
//                               textFamily: fontFamilyBold,
//                               textSize: 32.px,
//                             ),
//                           ).paddingOnly(top: 24.px, left: 32.px, right: 32.px, bottom: 32.px),
//                         ),
//
//                         // Buttons Row
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             CommonButton(
//                               title: Strings.UncollapseAll,
//                               border: Border.all(color: controller.appColors.appColor),
//                               radius: 100.px,
//                               width: 198.px,
//                               height: 47.px,
//                               padding: EdgeInsets.symmetric(vertical: 15.px, horizontal: 24.px),
//                               textSize: 16.px,
//                               textWeight: FontWeight.w500,
//                               textFamily: fontFamilyRegular,
//                               textColor: controller.appColors.appColor,
//                               color: controller.appColors.transparent,
//                               onTap: controller.uncollapseAll,
//                             ),
//                             CommonIconButton(
//                               title: Strings.addArea,
//                               radius: 100.px,
//                               width: 191.px,
//                               height: 44.px,
//                               color: controller.appColors.appColor,
//                               padding: EdgeInsets.symmetric(horizontal: 24.px),
//                               textSize: 16.px,
//                               textWeight: FontWeight.w500,
//                               textFamily: fontFamilyRegular,
//                               onTap: () =>showAddAreaDialog(), // Add new area (default)
//                               iconColor: controller.appColors.white,
//                               icon: addIcon,
//                               iconheigth: 20.px,
//                             ).paddingOnly(left: 32.px, right: 32.px, bottom: 10.px),
//                           ],
//                         ).paddingOnly(left: 32.px, right: 32.px, bottom: 32.px),
//
//                         // List of Expandable Areas in Two Columns
//                         Obx(() {
//                           // Split the indices into two groups (left/right)
//                           final leftIndices = <int>[];
//                           final rightIndices = <int>[];
//
//                           for (var i = 0; i < controller.areas.length; i++) {
//                             if (i % 2 == 0) {
//                               leftIndices.add(i);
//                             } else {
//                               rightIndices.add(i);
//                             }
//                           }
//
//                           return SingleChildScrollView(
//                             padding: EdgeInsets.symmetric(horizontal: 32.px),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     // Left column
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                                         children: List.generate(leftIndices.length, (columnIndex) {
//                                           final actualIndex = leftIndices[columnIndex];
//                                           final area = controller.areas[actualIndex];
//
//                                           return Container(
//                                             // Vertical spacing between cards
//                                             margin: EdgeInsets.only(bottom: 16.px),
//                                             child: UnitScreenExpandableRoomCard(
//                                               // 1. NEW: When a detail is tapped, navigate
//                                               onItemTap: (detailSelected) {
//                                                 Get.toNamed(
//                                                   '/deficiencyListing', // or your route
//                                                   arguments: {
//                                                     'areaName': area.name,
//                                                     'areaType': area.areaType,
//                                                     'detail': detailSelected,
//                                                   },
//                                                 );
//                                               },
//                                               areaType: area.areaType,
//                                               details: area.details,
//                                               areaName: area.name,
//                                               isExpanded: area.expanded.value,
//                                               onToggle: () => controller.toggleExpand(actualIndex),
//                                               onAdd: () => controller.addAnotherArea(actualIndex,area.areaType),
//                                             ),
//                                           );
//                                         }),
//                                       ),
//                                     ),
//
//                                     // Horizontal gap between columns
//                                     SizedBox(width: 16.px),
//
//                                     // Right column
//                                     Expanded(
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                                         children: List.generate(rightIndices.length, (columnIndex) {
//                                           final actualIndex = rightIndices[columnIndex];
//                                           final area = controller.areas[actualIndex];
//
//                                           return Container(
//                                             margin: EdgeInsets.only(bottom: 16.px),
//                                             child: UnitScreenExpandableRoomCard(
//                                               // 1. NEW: When a detail is tapped, navigate
//                                               onItemTap: (detailSelected) {
//                                                 Get.toNamed(
//                                                   '/deficiencyListing', // or your route
//                                                   arguments: {
//                                                     'areaName': area.name,
//                                                     'areaType': area.areaType,
//                                                     'detail': detailSelected,
//                                                   },
//                                                 );
//                                               },
//                                               areaType: area.areaType,
//                                               details: area.details,
//                                               areaName: area.name,
//                                               isExpanded: area.expanded.value,
//                                               onToggle: () => controller.toggleExpand(actualIndex),
//                                               onAdd: () => controller.addAnotherArea(actualIndex,area.areaType),
//                                             ),
//                                           );
//                                         }),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     CommonButton(
//                                       title: Strings.inspectionSummary,
//                                       textColor: AppColors().border1,        // Always gray text
//                                       color: AppColors().black.withOpacity(0.12), // Always “disabled” background
//                                       radius: 35.px,
//                                       textWeight: FontWeight.w600,
//                                       textSize: 16.px,
//                                       padding: EdgeInsets.symmetric(
//                                         horizontal: 24.px,
//                                         vertical: 12.px,
//                                       ),
//                                       onTap: () {
//                                         // No controller logic here, so do nothing
//                                       },
//                                     ).paddingSymmetric(vertical: 48.px)
//
//                                   ],)
//                               ],
//                             ),
//                           );
//                         }),
//
//
//                         // Bottom Padding to Prevent Clipping
//                         SizedBox(height: 32.px),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//   void showAddAreaDialog() {
//     Get.dialog(
//       GetBuilder<InspireVUnitScreenController>(
//         builder: (controller) {
//           String selectedAreaType = Strings.inside; // Default selection
//           String? selectedArea;
//
//           return StatefulBuilder(
//             builder: (context, setState) {
//               List<String> currentAreaKeys = selectedAreaType == 'Inside'
//                   ? controller.insideAreas.keys.toList()
//                   : controller.outsideAreas.keys.toList();
//
//               return Dialog(
//                 backgroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(24.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Title
//                       Center(
//                         child: Text(
//                           Strings.addNewArea,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 24),
//
//                       // AREA TYPE LABEL
//                       Text(
//                         Strings.areaType,
//                         style: TextStyle(
//                           color:  controller.appColors.appColor,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//
//                       // Radio Buttons Vertical
//                       Column(
//                         children: [
//                           RadioListTile<String>(
//                             title: Text(Strings.inside),
//                             value: 'Inside',
//                             groupValue: selectedAreaType,
//                             contentPadding: EdgeInsets.zero,
//                             visualDensity: VisualDensity.compact,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedAreaType = value!;
//                                 selectedArea = null;
//                               });
//                             },
//                           ),
//                           RadioListTile<String>(
//                             title: Text(Strings.outside),
//                             value: 'Outside',
//                             groupValue: selectedAreaType,
//                             contentPadding: EdgeInsets.zero,
//                             visualDensity: VisualDensity.compact,
//                             onChanged: (value) {
//                               setState(() {
//                                 selectedAreaType = value!;
//                                 selectedArea = null;
//                               });
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 16),
//
//                       // Dropdown Label
//                       Text(
//                         Strings.area,
//                         style: TextStyle(
//                           color: Colors.grey.shade700,
//                           fontSize: 12,
//                         ),
//                       ),
//                       SizedBox(height: 4),
//
//                       // Dropdown
//                       DropdownButtonFormField<String>(
//                         value: selectedArea,
//                         dropdownColor: Colors.white,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                         items: [
//                           DropdownMenuItem<String>(
//                             enabled: false,
//                             child: Text(
//                               selectedAreaType.toUpperCase(),
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: controller.appColors.appColor,
//                               ),
//                             ),
//                           ),
//                           ...currentAreaKeys.map((area) {
//                             return DropdownMenuItem<String>(
//                               value: area,
//                               child: Text(area),
//                             );
//                           }).toList()
//                         ],
//                         onChanged: (value) {
//                           setState(() {
//                             selectedArea = value;
//                           });
//                         },
//                       ),
//                       SizedBox(height: 24),
//
//                       // Action Buttons
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           TextButton(
//                             onPressed: () => Get.back(),
//                             child: Text(Strings.cancel, style: TextStyle(color: controller.appColors.appColor)),
//                           ),
//                           SizedBox(width: 12),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: controller.appColors.appColor,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(24),
//                               ),
//                               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                             ),
//                             onPressed: selectedArea != null
//                                 ? () {
//                               // controller.addSelectedArea(selectedArea!, selectedAreaType);
//                               // Get.back();
//                             }
//                                 : null,
//                             child: Text(
//                               Strings.save,
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
//
// }
