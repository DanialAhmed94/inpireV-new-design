import 'package:flutter_svg/flutter_svg.dart';
import 'package:public_housing/commons/all.dart';
import 'package:public_housing/screens/inspection_screen/deficienciesCard_widget.dart';

import '../../../signatures_screen/screen/signature_screen.dart';
import '../../signatureScreen/screen/signaturesScreen_screen.dart';
import '../controller/quickPassInspectionSummary_controller.dart';



class QPInspireVInspectionSummaryScreen extends GetView<QPInspireVInspectionSummaryController> {
  const QPInspireVInspectionSummaryScreen({Key? key}) : super(key: key);
  static const routes = "/QPInpireVInspectionSummaryScreen";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QPInspireVInspectionSummaryController>(
      builder: (controller) {
        return BaseScreen(
          backgroundColor: controller.appColors.appBGColor,
          child: Column(
            children: [
              CommonAppBar(color: controller.appColors.transparent, radius: 0.px),
              Expanded(
                flex: 1,
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child:  MyTextView(
                            "Avalon Gardens - 422047",
                            textStyleNew: MyTextStyle(
                              textSize: Utils.isMediumScreen(context) ? 24.px : 20.px,
                              textWeight: FontWeight.w600,
                              textColor: controller.appColors.appColor,
                              textFamily: fontFamilyBold,
                            ),
                          ).paddingOnly(
                              top: 24.px,
                              left: 32.px,
                              right: 32.px,
                              bottom: 16.px),
                          // child: MyTextView(
                          //   controller.item == null
                          //       ? ""
                          //       : "${controller.item!.massage}, ${controller.itemTitle} - ${controller.item!.title}",
                          //   textStyleNew: MyTextStyle(
                          //     textSize: Utils.isMediumScreen(context) ? 24.px : 20.px,
                          //     textWeight: FontWeight.w600,
                          //     textColor: controller.appColors.appColor,
                          //     textFamily: fontFamilyBold,
                          //   ),
                          // ),
                        ),

                        CommonButton(
                            title: Strings.annualInspection,
                            textSize: 14.px,
                            isSmall: false,
                            isBig: true,
                            radius: 100.px,
                            textWeight: FontWeight.w500,
                            color: controller.appColors.white,
                            textColor:
                                controller.appColors.textGreen,

                            onTap: () {})

                      ],
                    ).paddingOnly(top: 32.px),
                    Column(
                      children: [
                        MyTextView(
                          Strings.inspectionSummary,
                          textStyleNew: MyTextStyle(
                            textSize: 32.px,
                            textWeight: FontWeight.w600,
                            textColor: controller.appColors.appColor,
                            textFamily: fontFamilyBold,
                          ),
                        ).paddingSymmetric(vertical: 56.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTextView(
                              Strings.summaryDecision,
                              textStyleNew: MyTextStyle(
                                textSize: 24.px,
                                textWeight: FontWeight.w400,
                                textColor: controller.appColors.black,
                                textFamily: fontFamilyRegular,
                              ),
                            ).paddingOnly(right: 16.px),
                            Expanded(
                              child: Container(
                                height: 2.px,
                                color: AppColors().divider,
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 32.px),
                        Form(
                          child: Column(
                            children: [
                              Obx(() => Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16.px),
                                  border: Border.all(color: controller.appColors.grey.withOpacity(0.4)),
                                ),
                                child: Column(
                                  children: ["Pass", "Fail", "Inconclusive"].asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final status = entry.value;
                                    final isSelected = controller.selectedDecision.value == status;

                                    return Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 12.px),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: MyTextView(
                                                  status,
                                                  textStyleNew: MyTextStyle(
                                                    textSize: 16.px,
                                                    textWeight: FontWeight.w400,
                                                    textColor: controller.appColors.black,
                                                    textFamily: fontFamilyRegular,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () => controller.selectedDecision.value = status,
                                                child: Container(
                                                  width: 20.px,
                                                  height: 20.px,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border: Border.all(
                                                      color: controller.appColors.appColor,
                                                      width: 2.px,
                                                    ),
                                                  ),
                                                  child: isSelected
                                                      ? Center(
                                                    child: Container(
                                                      width: 10.px,
                                                      height: 10.px,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(0xFF005E0A),
                                                      ),
                                                    ),
                                                  )
                                                      : SizedBox.shrink(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Divider below each row except the last one
                                        if (index < 2)
                                          Divider(
                                            thickness: 1,
                                            height: 0,
                                            color: controller.appColors.grey.withOpacity(0.4),
                                          ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              )),
                  SizedBox(height: 32,),
                              TextField(
                                readOnly: true,
                                controller: TextEditingController(
                                  text: "Arrived 10 min late due traffic. -PM",
                                ),
                                decoration: InputDecoration(
                                  labelText: "Inspection Notes",
                                  floatingLabelBehavior: FloatingLabelBehavior.always, // Always show label outside
                                  labelStyle: TextStyle(
                                    fontSize: 12.px,
                                    color: Colors.black,
                                  ),
                                  prefixIcon: Icon(Icons.comment, size: 16.px, color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24.px),
                                    borderSide: const BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24.px),
                                    borderSide: const BorderSide(color: Colors.black),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24.px),
                                    borderSide: const BorderSide(color: Colors.black, width: 1.5),
                                  ),
                                  fillColor: Colors.transparent,
                                  filled: true,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(vertical: 12.px),
                                ),
                                style: TextStyle(
                                  fontSize: 14.px,
                                  color: Colors.black,
                                ),
                              ),

                              SizedBox(height: 16,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  MyTextView(
                                    Strings.selectFindingType,
                                    textStyleNew: MyTextStyle(
                                      textColor: Colors.black,
                                      textSize: 20.px,
                                      textFamily: fontFamilyRegular,
                                      textWeight: FontWeight.w400,
                                    ),
                                  ).paddingOnly(bottom: 24.px),

                                  Row(
                                    children: [
                                      // Dropdown
                                      Flexible(
                                        flex: 2,
                                        child: DropdownButtonFormField<String>(
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            size: 20.px,
                                            color: controller.appColors.grey,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.symmetric(horizontal: 15.px),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: controller.appColors.grey),
                                              borderRadius: BorderRadius.circular(25.px),
                                            ),
                                            disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: controller.appColors.grey),
                                              borderRadius: BorderRadius.circular(25.px),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: controller.appColors.grey),
                                              borderRadius: BorderRadius.circular(25.px),
                                            ),
                                            filled: true,
                                            hintStyle: MyTextStyle(
                                              textWeight: FontWeight.w400,
                                              textSize: 15.px,
                                              textColor: controller.appColors.black,
                                            ),
                                            hintText: controller.dropDownValue,
                                            labelStyle: MyTextStyle(
                                              textWeight: FontWeight.w400,
                                              textSize: 15.px,
                                            ),
                                            fillColor: controller.appColors.transparent,
                                          ),
                                          onChanged: (String? value) {
                                            controller.dropDownValue = value!;
                                            controller.visibleBtn = true;
                                            controller.update();
                                          },
                                          items: controller.itemList
                                              .map((cityTitle) => DropdownMenuItem(
                                            value: cityTitle,
                                            child: MyTextView(
                                              cityTitle,
                                              textStyleNew: MyTextStyle(
                                                textWeight: FontWeight.w400,
                                                textSize: 15.px,
                                                textColor: controller.appColors.black,
                                              ),
                                            ),
                                          ))
                                              .toList(),
                                        ),
                                      ),

                                      SizedBox(width: 10.px),

                                      // Bedroom Text Field
                                      Flexible(
                                        flex: 1,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Bedroom',
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(10.px),
                                              child:  Icon(Icons.bed,
                                                  size: 20.px,
                                                  color: Colors.grey),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(25.px),
                                              borderSide: BorderSide(color: controller.appColors.grey),
                                            ),
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 10.px),

                                      // Bathroom Text Field
                                      Flexible(
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            labelText: 'Bathroom',
                                            prefixIcon: Padding(
                                              padding: EdgeInsets.all(10.px),
                                              child: SvgPicture.string(
                                                bathroomIcon,
                                                width: 10.px,
                                                height: 10.px,
                                                color: Colors.grey
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(25.px),
                                              borderSide: BorderSide(color: controller.appColors.grey),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )

                                ],
                              ),
                              SizedBox(
                                width: 16.px,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonButton(
                                title: Strings.noOneIsPresent,
                                textColor: controller.visibleBtn
                                    ? controller.appColors.appColor
                                    : controller.appColors.border1,
                                color: controller.appColors.transparent,
                                radius: 100.px,
                                textWeight: FontWeight.w600,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.px,
                                  vertical: 10.px,
                                ),
                                textSize: 16.px,
                                border: Border.all(
                                    color: controller.visibleBtn
                                        ? controller.appColors.grey
                                        : controller.appColors.lightText.withOpacity(0.2),
                                    width: 2),
                                onTap: () {
                                  if (controller.visibleBtn) {
                                    controller.dialogNoOnePresent();
                                  }
                                }),
                            SizedBox(
                              width: 16.px,
                            ),
                            CommonButton(
                                title: Strings.signatures,
                                textColor:Colors.white,
                                color: controller.appColors.appColor,
                                
                                radius: 100.px,
                                textWeight: FontWeight.w600,
                                textSize: 16.px,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.px,
                                  vertical: 10.px,
                                ),
                                // height: 55.px,
                                onTap: () {
                                  if (controller.visibleBtn) {
                                    Get.toNamed(InspireVSignatureScreen.routes, arguments: controller.item);
                                  }
                                }),
                          ],
                        ).paddingSymmetric(vertical: 48.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyTextView(
                              Strings.deficiencies,
                              textStyleNew: MyTextStyle(
                                textSize: 24.px,
                                textWeight: FontWeight.w400,
                                textColor: controller.appColors.black,
                                textFamily: fontFamilyRegular,
                              ),
                            ).paddingOnly(right: 16.px),
                            Expanded(
                              child: Container(
                                height: 2.px,
                                color: AppColors().divider,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 24.px),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12.px),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // Section 1: Pink header with [Standard]
                              Container(
                                padding: EdgeInsets.all(16.px),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade50.withOpacity(0.15),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.px),
                                    topRight: Radius.circular(12.px),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "[Standard]",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.px,
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 6.px),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade50,
                                            borderRadius: BorderRadius.circular(50), // Circular shape
                                          ),
                                          child: Text(
                                            "Unit",
                                            style: TextStyle(
                                              color: AppColors.primerColor,
                                              fontSize: 14.px,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.px),
                                    Container( // Full-width divider
                                      width: double.infinity,
                                      height: 1.px,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),


                              // Section 2: Image gallery
                              Padding(
                                padding: EdgeInsets.all(16.px),
                                child: Row(
                                  children: [
                                    for (int i = 0; i < 3; i++)
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 4.px),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.px),
                                            child: Image.asset(
                                              ImagePath.windowWall,
                                              height: 150.px,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),

                              // Section 3: Divider + Deficiency section with new background
                              // Section 3: Divider + Deficiency section with new background
                              Container(
                                padding: EdgeInsets.all(16.px),
                                decoration: BoxDecoration(
                                  color: Colors.pink.shade50.withOpacity(0.15),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.px),
                                    bottomRight: Radius.circular(12.px),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 1.px,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 16.px),
                                    Text("[Deficiency]",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.px,
                                      ),
                                    ),
                                    SizedBox(height: 8.px),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("• Comments: “6 of 10 cabinets are missing -NJ”",
                                                  style: TextStyle(fontSize: 14.px)),
                                              SizedBox(height: 4.px),
                                              Text("• Date: 06/18/2023",
                                                  style: TextStyle(fontSize: 14.px)),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.edit, size: 18.px, color: AppColors.primerColor),
                                            SizedBox(width: 4.px),
                                            Text("Edit",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14.px,
                                                  color: AppColors.primerColor,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),


                            ],
                          ),
                        ),



                      ],
                    ).paddingSymmetric(horizontal: 32.px),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
