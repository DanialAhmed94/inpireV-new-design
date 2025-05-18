import 'package:flutter_svg/svg.dart';

import '../../../../commons/all.dart';
import '../../unitScreen/controller/unitScreen_controller.dart';
import '../controller/inpireV_standardScreen_controller.dart';

class InspireVStandardScreen extends StatelessWidget {
  const InspireVStandardScreen({Key? key}) : super(key: key);
  static const String routes = '/inspireVStandardScreen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InspireVStandardScreenController>(
      init: InspireVStandardScreenController(),
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
                  onClickBack: () => controller.handleBackPressed(), // Updated
                ),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 32.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Title
                        Row(
                          children: [
                            Spacer(),
                            Center(
                              child: MyTextView(
                                "2113 Kendall Street - Fernando Devries",
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.appColor,
                                  textWeight: FontWeight.w600,
                                  textFamily: fontFamilyBold,
                                  textSize: 20.px,
                                ),
                              ).paddingOnly(top: 24.px,
                                  left: 32.px,
                                  right: 32.px,
                                  bottom: 32.px),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.px, vertical: 4.px),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                BorderRadius.circular(12.px),
                              ),
                              child: Text(
                                "Annual Inspection",
                                style: TextStyle(
                                  fontSize: 12.px,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green[800],
                                ),
                              ),
                            ),
                            SizedBox(width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.09,)
                          ],
                        ),

                        // Buttons Row
                        Row(

                          children: [
                            MyTextView(
                              "Unit Inspection",
                              textStyleNew: MyTextStyle(
                                  textColor: AppColors.primerColor,
                                  textSize: 40,
                                  textWeight: FontWeight.w500,
                                  textFamily: "Roboto"
                              ),
                              textAlignNew: TextAlign.center, // optional
                              maxLinesNew: 2, // optional
                              isMaxLineWrap: true, // allow wrapping
                            ),
                            Spacer(),
                            Obx(() {
                              final dummy = controller.dummyRx.value;

                              // Check if the controller exists
                              final isControllerAvailable = Get.isRegistered<InspireVUnitScreenController>();

                              // If not available yet, disable the button
                              if (!isControllerAvailable) {
                                return CommonButton(
                                  title: "Special Amenities",
                                  onTap: null,
                                  color: Colors.grey,
                                  textSize: 16,
                                  textFamily: "Roboto",
                                  textWeight: FontWeight.w500,
                                ).paddingOnly(left: 32.px, right: 32.px, bottom: 10.px);
                              }

                              // Access the controller safely
                              final unitController = Get.find<InspireVUnitScreenController>();
                              print("*******************u${unitController.completedDetails}");

                               final isEnabled = unitController.hasCompletedDetails;
                             // final isEnabled = unitController.completedDetails.values.any((v) => v);

                              return CommonButton(
                                title: "Special Amenities",
                                onTap: isEnabled ? () => controller.onSpecialAmenitiesTap() : null,
                                color: isEnabled ? AppColors.primerColor : Colors.grey,
                                textSize: 16,
                                textFamily: "Roboto",
                                textWeight: FontWeight.w500,
                              ).paddingOnly(left: 32.px, right: 32.px, bottom: 10.px);
                            }),


                          ],
                        ).paddingOnly(left: 32.px, right: 32.px, bottom: 32.px),

                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.px, vertical: 16.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              // Unit card
                              GestureDetector(
                                onTap: () {
                                  // TODO: handle unit card tap
                                  controller.onUnitCardTap();
                                },
                                child: Container(
                                  width: 194.px,
                                  height: 247.px,
                                  padding: EdgeInsets.all(12.5.px),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.px),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 6.px,
                                        offset: Offset(0, 3.px),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150.px,
                                        height: 150.px,
                                        decoration: BoxDecoration(
                                          color: Colors.blue.shade50,
                                          borderRadius: BorderRadius.circular(16.px),
                                        ),
                                        child: Center(
                                          child: SvgPicture.string(homeCardIcon),
                                        ),
                                      ),
                                      SizedBox(height: 8.px),
                                      MyTextView(
                                        'Unit',
                                        textStyleNew: MyTextStyle(
                                          textColor: Colors.grey.shade800,
                                          textWeight: FontWeight.w600,
                                          textSize: 14.px,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Inside card
                              GestureDetector(
                                onTap: () {
                                  // TODO: handle inside card tap
                                  controller.onInsideCardTap();
                                },
                                child: Container(
                                  width: 194.px,
                                  height: 247.px,
                                  padding: EdgeInsets.all(12.5.px),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.px),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 6.px,
                                        offset: Offset(0, 3.px),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150.px,
                                        height: 150.px,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow.shade50,
                                          borderRadius: BorderRadius.circular(16.px),
                                        ),
                                        child: Center(
                                          child: SvgPicture.string(insideCardIcon),
                                        ),
                                      ),
                                      SizedBox(height: 8.px),
                                      MyTextView(
                                        'Inside',
                                        textStyleNew: MyTextStyle(
                                          textColor: Colors.grey.shade800,
                                          textWeight: FontWeight.w600,
                                          textSize: 14.px,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Outside card
                              GestureDetector(
                                onTap: () {
                                  // TODO: handle outside card tap
                                  controller.onOutsideCardTap();
                                },
                                child: Container(
                                  width: 194.px,
                                  height: 247.px,
                                  padding: EdgeInsets.all(12.5.px),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16.px),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.05),
                                        blurRadius: 6.px,
                                        offset: Offset(0, 3.px),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 150.px,
                                        height: 150.px,
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade50,
                                          borderRadius: BorderRadius.circular(16.px),
                                        ),
                                        child: Center(
                                          child: SvgPicture.string(outsideCardIcon),
                                        ),
                                      ),
                                      SizedBox(height: 8.px),
                                      MyTextView(
                                        'Outside',
                                        textStyleNew: MyTextStyle(
                                          textColor: Colors.grey.shade800,
                                          textWeight: FontWeight.w600,
                                          textSize: 14.px,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),

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