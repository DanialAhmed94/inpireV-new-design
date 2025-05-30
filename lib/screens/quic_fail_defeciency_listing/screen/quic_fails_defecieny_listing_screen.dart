import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../commons/all.dart';
import '../../quic_fails_deficiency_detail/quic_fails_deficiency_detail_screen/quic_fails_deficiency_detail_screen.dart';
import '../controller/quic_fail_defeciency_listing_controller.dart';
class QuickFailDeficiencyListingScreen
    extends GetView<DeficiencyListingController> {
  const QuickFailDeficiencyListingScreen({Key? key}) : super(key: key);
  static const String routes = '/deficiencyListing';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeficiencyListingController>(
      init: DeficiencyListingController(),
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
                            itemCount: controller.deficiencyList.length,
                            itemBuilder: (context, index) {
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
                                          controller.areaType,
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
                                        // Now place the check icon *after* the text
                                        if (controller.deficiencyCompleted[index]) ...[
                                          SizedBox(width: 8.px),
                                          SvgPicture.string(successIcon),
                                        ],
                                        TextButton(
                                          onPressed: () async {
                                            // We already have `index` in the builder, so use that:
                                            final result = await Get.toNamed(
                                              QuickFailDeficiencyDetailScreen.routes,
                                              arguments: {
                                                "deficiencyIndex": index, // pass the deficiency index to detail screen
                                              },
                                            );

                                            // If the detail screen returns a result, mark that deficiency completed
                                            if (result != null && result["deficiencyIndex"] != null) {
                                              final returnedIndex = result["deficiencyIndex"] as int;
                                              // Update in the controller:
                                              controller.deficiencyCompleted[returnedIndex] = true;
                                              // Then call update() so the UI sees the green check
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
                                ],
                              );
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


