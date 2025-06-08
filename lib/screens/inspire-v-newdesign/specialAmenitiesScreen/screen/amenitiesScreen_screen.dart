// screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../commons/all.dart';
import '../controller/amenitiesScreen_controller.dart';
import '../widget/expandablecard.dart';

class InspireVAmenitiesScreen extends StatelessWidget {
   InspireVAmenitiesScreen({Key? key}) : super(key: key);
  static const String routes = '/inspireVAmenitiesScreen';
  final GlobalKey _topKey = GlobalKey();  // add this key

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InspireVAmenitiesScreenController>(
      init: InspireVAmenitiesScreenController(),
      assignId: true,
      builder: (controller) {
        return BaseScreen(
          backgroundColor: controller.appColors.appBGColor,
          child: SafeArea(
            child: Column(
              children: [
                CommonAppBar(
                  color: controller.appColors.transparent,
                  radius: 0.px,
                  onClickBack: () => Get.back(),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 32.px),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          key: _topKey, // Assign key here

                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center, // center vertically
                            children: [
                              Flexible(
                                child: MyTextView(
                                  "Rent Reasonableness Survey", // long text example
                                  textStyleNew: MyTextStyle(
                                    textColor: controller.appColors.appColor,
                                    textWeight: FontWeight.w500,
                                    textFamily: "Roboto",
                                    textSize: 40.px,
                                  ),
                                   overflowText: TextOverflow.visible,
                                   maxLinesNew: 2,
                                ).paddingOnly(top: 24.px, right: 32.px, bottom: 32.px),
                              ),
                              CommonButton(
                                title: "Inspection Summary",
                                onTap: () {
                                  controller.onSpecialAminitiesTap();
                                },
                                color: AppColors().appColor,
                              ),
                            ],
                          ),
                        ),

                        DropdownButtonFormField<String>(
                          dropdownColor: Colors.white,

                          value: controller.selectedUnitType,
                          decoration: InputDecoration(
                            labelText: 'Unit Type',
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(30)),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                          ),
                          items: controller.inspectionTypes.map((type) {
                            return DropdownMenuItem<String>(
                              value: type,
                              child: Text(type),
                            );
                          }).toList(),
                          onChanged: (val) {
                            controller.selectedUnitType = val!;
                            controller.update();
                          },
                        ),
                        SizedBox(height: 16.px),

                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller:
                                controller.unitSizeeController,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    // Regular
                                    fontSize: 16),
                                decoration: _inputDecoration(
                                  label: 'Unit Size',
                                  hint: 'Square Feet (approximate)',
                                 prefixIcon: SizedBox(
                                  width: 24,  // control width
                                  height: 24, // control height
                                  child: Padding(
                                    padding: const EdgeInsets.all(12), // adjust padding if needed
                                    child: SvgPicture.string(cubeIcon),
                                  ),
                                ),

                        ),
                              ),
                            ),
                            SizedBox(width: 12.px),
                            Expanded(
                              child: TextFormField(
                                controller:
                                controller.unitAgeController,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w400,
                                    // Regular
                                    fontSize: 16),
                                decoration: _inputDecoration(
                                  label: 'Age of Unit',
                                  hint: 'Age of Unit',
                                  prefixIcon: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: SvgPicture.string(unitAgeIcon),
                                    ),
                                  ),

                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(controller.sections.length, (index) {
                            final section = controller.sections[index];
                            return Theme(
                              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                initiallyExpanded: section.isExpanded,
                                onExpansionChanged: (value) => controller.toggleSection(index, value),
                                tilePadding: EdgeInsets.zero,
                             title: Row(
                              children: [
                              Text(
                              "${section.title}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24.px,
                                  fontFamily: "Roboto",
                                ),
                              ),
                              SizedBox(width: 12.px),
                              Expanded(
                                child: Container(
                                  height: 1.px,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                              ],
                            ),

                            children: section.options.map((option) {
                                  return ListTile(
                                    dense: true,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                                    leading: Checkbox(
                                      value: option.isChecked,
                                      onChanged: (val) {
                                        controller.toggleOption(index, option.label, val!);
                                      },
                                    ),
                                    title: Text(option.label,style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.px,
                                        fontFamily: "Roboto"
                                    ),),
                                  );
                                }).toList()
                              ..addAll([
                                ListTile(
                                  leading: Checkbox(
                                    value: section.otherChecked,
                                    onChanged: (val) {
                                      section.otherChecked = val!;
                                      controller.update();
                                    },
                                  ),
                                  title: TextField(
                                    controller: section.otherController,
                                    enabled: section.otherChecked,
                                    readOnly: !section.otherChecked,
                                    decoration: InputDecoration(
                                      hintText: "Other",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(24.px),
                                      ),
                                      fillColor: Colors.grey.shade100,
                                      filled: true,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 16.px),
                                    ),
                                  ),
                                ),
                              ])


                              ),
                            );
                          }),
                        ),

                        SizedBox(height: 32.px),
                        Obx(() => Row(
                          children: [
                            MyTextView(
                              "Unit is accessible to a particular disability:",
                              textStyleNew: MyTextStyle(
                                  textColor: Colors.black,
                                  textSize: 20.px,
                                  textWeight: FontWeight.w400,
                                  textFamily: "Roboto"
                              ),
                            ),
                            Spacer(),
                            Switch(
                              value: controller.isDisabilityAccessible.value,
                              onChanged: controller.toggleDisabilityAccess,
                            ),
                            SizedBox(width: 4),
                            Text(
                              controller.isDisabilityAccessible.value ? "Yes" : "No",
                              style: TextStyle(fontSize: 16.px),
                            ),
                          ],
                        )),
                        SizedBox(height: 8.px),
                        Obx(() => TextField(
                          controller: controller.disabilityController,
                          enabled: controller.isDisabilityAccessible.value,
                          readOnly: !controller.isDisabilityAccessible.value,
                          decoration: InputDecoration(
                            hintText: "Disability",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.px),
                            ),
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16.px),
                          ),
                        )),
                        SizedBox(height: 24.px),
// Add to screen.dart after the disability field

                        // Inside InspireVAmenitiesScreen build method (instead of UtilitiesAmenitiesCard)
                        AdditionalExpandableSection(
                          title: "Utilities Included",
                          options: controller.utilitiesOptions,
                        ),
                        SizedBox(height: 16.px),
                        AdditionalExpandableSection(
                          title: "Appliances",
                          options: controller.applianceOptions,
                        ),
                        SizedBox(height: 16.px),
                        AdditionalExpandableSection(
                          title: "Amenities",
                          options: controller.amenityOptions,
                        ),
                        SizedBox(height: 16.px),
                        AdditionalExpandableSection(
                          title: "Neighborhood Features",
                          options: controller.neighborhoodOptions,
                        ),

// Utilities & Amenities Section
                      //  UtilitiesAmenitiesCard(),
                        SizedBox(height: 16.px),
                        SingleRadioExpandableSection(
                          title: "Construction Qualities",
                          selectedValue: controller.constructionQuality,
                          options: controller.constructionQualityOptions,
                        ),
// Condition & Maintenance Section
                       // ConditionMaintenanceCard(),
                        SizedBox(height: 16.px),
                        SingleRadioExpandableSection(
                          title: "Condition/Maintenance",
                          selectedValue: controller.maintenanceCondition,
                          options: controller.maintenanceConditionOptions,
                        ),
// Systems Section
                        SystemsCard(),
                        SizedBox(height: 24.px),

// Back to Top Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,         // Gray background
                                foregroundColor: Colors.black,        // Black text and icon color
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              ),
                              onPressed: () async {
                                final context = _topKey.currentContext;
                                if (context != null) {
                                  await Scrollable.ensureVisible(
                                    context,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Back to the Top"),
                                  SizedBox(width: 8),
                                  Icon(Icons.arrow_upward_outlined),
                                ],
                              ),
                            ),

                            SizedBox(width: 12,),
                            CommonButton(
                              title: "Save",
                              onTap: () {
                                  controller.onSvaveAminties();
                              },
                              color: AppColors().appColor,
                            ),
                          ],
                        ),
                        SizedBox(height: 24.px),

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
  InputDecoration _inputDecoration({
    required String label,
    required String hint,
    Widget? prefixIcon,
  }) =>
      InputDecoration(
        prefixIcon: prefixIcon,
        // Use the prefixIcon parameter

        labelText: label,
        labelStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400, // Regular
            fontSize: 16),
        hintText: hint,
        hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400, // Regular
            fontSize: 16),

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(
          // <-- change this to your desired container color:
          // backgroundColor:  Colors.black,
          color: Colors.black,
          fontSize: 12,
        ),

        enabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
      );
}
