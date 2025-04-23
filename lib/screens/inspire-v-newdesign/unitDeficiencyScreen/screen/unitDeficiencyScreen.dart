import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../commons/all.dart';
import '../../unitDeficiencyDetailScreen/screen/unitDeficiencyDetailScreen_screen.dart';
import '../controller/unitDeficiencyScreen_controller.dart';
class InspireVUnitDeficiencyScreen
    extends GetView<InspireVUnitDeficiencyScreenController> {
  const InspireVUnitDeficiencyScreen({Key? key}) : super(key: key);
  static const String routes = '/inspireVUnitDeficiencyScreen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InspireVUnitDeficiencyScreenController>(
      init: InspireVUnitDeficiencyScreenController(),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            bottom: 32.px,
                          ),
                        ),
                        MyTextView(
                          Strings.cabinetStorage,
                          textStyleNew: MyTextStyle(
                            textColor: controller.appColors.appColor,
                            textWeight: FontWeight.bold,
                            textFamily: fontFamilyBold,
                            textSize: 24.px,
                          ),
                        ).paddingOnly(right: 10.px),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Row(
                          children: [
                            MyTextView(
                              Strings.deficienciesQF,
                              textStyleNew: MyTextStyle(
                                textColor: controller.appColors.black,
                                textFamily: fontFamilyBold,
                                textSize: 20.px,
                              ),
                            ).paddingOnly(right: 10.px),
                            Spacer(),
                            CommonButton(
                              title: Strings.standardInfo,
                              border: Border.all(color: controller.appColors.black),
                              radius: 100.px,
                              width: 198.px,
                              height: 47.px,
                              padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 15.px),
                              textWeight: FontWeight.w500,
                              textFamily: fontFamilyRegular,
                              textColor: controller.appColors.appColor,
                              color: controller.appColors.transparent,
                              onTap: () {},
                            ),
                          ],
                        ),
                        SizedBox(height: 16.px),
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.deficiencyList.length + 1, // Add 1 for the Take Photo section
                            itemBuilder: (context, index) {
                              if (index < controller.deficiencyList.length) {
                                // Render deficiency items
                                final item = controller.deficiencyList[index];
                                return Column(
                                  children: [
                                    Divider(),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8.px),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(width: 8.px),
                                          MyTextView(
                                            "Unit",
                                            textStyleNew: MyTextStyle(
                                              textColor: controller.appColors.textGreen,
                                              textWeight: FontWeight.bold,
                                              textSize: 18.px,
                                            ),
                                          ).paddingOnly(right: 12.px),
                                          Expanded(
                                            child: MyTextView(
                                              item,
                                              textStyleNew: MyTextStyle(
                                                textColor: controller.appColors.black,
                                                textSize: 16.px,
                                              ),
                                            ),
                                          ),
                                          if (controller.deficiencyCompleted[index])
                                            SvgPicture.string(successIcon),
                                          TextButton(
                                            onPressed: () async {
                                              final result = await Get.toNamed(
                                                InpireVUnitDeficiencyDetailScreen.routes,
                                                arguments: {"deficiencyIndex": index},
                                              );
                                              if (result != null && result["deficiencyIndex"] != null) {
                                                controller.deficiencyCompleted[result["deficiencyIndex"] as int] = true;
                                                controller.update();
                                              }
                                            },
                                            child: MyTextView(
                                              Strings.seeMoreQF,
                                              textStyleNew: MyTextStyle(
                                                textColor: controller.appColors.appColor,
                                                textSize: 16.px,
                                                textWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    SizedBox(height: 20.px),
                                  ],
                                );
                              } else {
                                // Render Take Photo section as the last item
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyTextView(
                                      "Take a photo without choosing a deficiency",
                                      textStyleNew: MyTextStyle(
                                        textColor: controller.appColors.black,
                                        textWeight: FontWeight.bold,
                                        textSize: 16.px,
                                      ),
                                    ).paddingOnly(right: 12.px),
                                    SizedBox(height: 20.px),
                                    ShadowContainer1(
                                      color: controller.appColors.white,
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.zero,
                                      radius: 8.px,
                                      elevation: 1,
                                      child: Container(
                                        height: 200.px,
                                        width: Get.width,
                                        padding: EdgeInsets.all(32.px),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.string(
                                              icImage,
                                              width: 80.px,
                                              height: 80.px,
                                              color: controller.appColors.appColor,
                                            ),
                                            SizedBox(height: 16.px),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: Strings.takeOrUpload,
                                                    style: MyTextStyle(
                                                      textSize: 16.px,
                                                      textWeight: FontWeight.w600,
                                                      textColor: controller.appColors.appColor,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: Strings.photoOfThe,
                                                    style: MyTextStyle(
                                                      textSize: 16.px,
                                                      textWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: Strings.deficiency,
                                                    style: MyTextStyle(
                                                      textSize: 16.px,
                                                      textWeight: FontWeight.w600,
                                                      textColor: controller.appColors.appColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
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


