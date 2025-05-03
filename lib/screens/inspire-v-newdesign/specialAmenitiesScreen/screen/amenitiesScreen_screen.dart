// screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../commons/all.dart';
import '../controller/amenitiesScreen_controller.dart';

class InspireVAmenitiesScreen extends StatelessWidget {
  const InspireVAmenitiesScreen({Key? key}) : super(key: key);
  static const String routes = '/inspireVAmenitiesScreen';

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
                        Row(
                          children: [
                            MyTextView(
                              "Special Amenities",
                              textStyleNew: MyTextStyle(
                                textColor: controller.appColors.appColor,
                                textWeight: FontWeight.w500,
                                textFamily: "Roboto",
                                textSize: 40.px,
                              ),
                            ).paddingOnly(top: 24.px, right: 32.px, bottom: 32.px),
                            Spacer(),
                            CommonButton(
                              title: "Inspection Summary",
                              onTap: () {controller.onSpecialAminitiesTap();},
                              color: AppColors().appColor,
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
                              "${index + 1}. ${section.title}",
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
                                  ..addIf(
                                    section.title == "Living Room",
                                    ListTile(
                                      leading: Checkbox(value: false, onChanged: (v) {}),
                                      title: TextField(
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
                                  ),
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
                        Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonButton(
                              title: "Continue to Standards",
                              textColor: controller.isDisabilityAccessible.value &&
                                  controller.disabilityText.value.isNotEmpty
                                  ? Colors.white
                                  : AppColors().border1,
                              color: controller.isDisabilityAccessible.value &&
                                  controller.disabilityText.value.isNotEmpty
                                  ? AppColors().appColor
                                  : AppColors().black.withOpacity(0.12),
                              radius: 35.px,
                              textWeight: FontWeight.w600,
                              textSize: 16.px,
                              padding: EdgeInsets.symmetric(horizontal: 24.px, vertical: 12.px),
                              onTap: controller.isDisabilityAccessible.value &&
                                  controller.disabilityText.value.isNotEmpty
                                  ? () {
                                // Do something
                              }
                                  : null,
                            ).paddingSymmetric(vertical: 48.px),
                          ],
                        )),
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
}
