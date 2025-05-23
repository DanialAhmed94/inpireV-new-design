import 'package:flutter_svg/svg.dart';
import 'package:public_housing/commons/common_widgets/common_row.dart';
import 'package:public_housing/screens/unit_building_standards_screen/screen/unit_building_standards_screen.dart';
import 'package:public_housing/screens/unit_inspection_screen/controller/unit_inspection_controller.dart';
import '../../../commons/all.dart';
import '../../quic_fails_inspection_screen/screen/area_listing_screen.dart';
import '../widget/title_head_menu_widget.dart';

class UnitInspection extends GetView<UnitController> {
  const UnitInspection({Key? key}) : super(key: key);

  static const routes = "/UnitInspection";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UnitController>(
      init: UnitController(),
      assignId: true,
      builder: (controller) {
        return BaseScreen(
          backgroundColor: controller.appColors.appBGColor,
          child: Column(
            children: [
              CommonAppBar(
                color: controller.appColors.transparent,
                radius: 0.px,
                onClickBack: () {
                  Get.back();
                },
              ),
              Expanded(
                child: ListView(
                  children: [
                    Center(
                      child: MyTextView(
                        Strings.unitinpection,
                        textStyleNew: MyTextStyle(
                          textColor: controller.appColors.appColor,
                          textWeight: FontWeight.w600,
                          textFamily: fontFamilyBold,
                          textSize: 32.px,
                        ),
                      ).paddingOnly(
                          top: 24.px, left: 32.px, right: 32.px, bottom: 32.px),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                MyTextView(
                                  Strings.unitInformation,
                                  textStyleNew: MyTextStyle(
                                    textColor: controller.appColors.black,
                                    textWeight: FontWeight.w400,
                                    textFamily: fontFamilyBold,
                                    textSize: 24.px,
                                  ),
                                ).paddingOnly(right: 10.px),
                                Expanded(
                                  child: Container(
                                    height: 2.px,
                                    color: AppColors().divider,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonTextField(
                                    isLable: true,
                                    readOnly: false,
                                    controller: controller.unitNumberName,
                                    onChange: ((value) {
                                      controller.update();
                                    }),
                                    color: controller.appColors.transparent,
                                    prefixIcon: SvgPicture.string(
                                      ichome1,
                                      color: controller.appColors.grey,
                                    ).paddingOnly(left: 15.px, right: 15.px),
                                    padding: EdgeInsets.zero,
                                    contentPadding:
                                        EdgeInsets.only(left: 25.px),
                                    shadowColor:
                                        controller.appColors.transparent,
                                    labelText: Strings.unitnumberName,
                                  ),
                                ),
                                SizedBox(width: 16.px),
                                Expanded(
                                  child: CommonTextField(
                                    isLable: true,
                                    readOnly: false,
                                    onChange: ((value) {
                                      controller.update();
                                    }),
                                    controller: controller.unitAddress,
                                    color: controller.appColors.transparent,
                                    prefixIcon: SvgPicture.string(
                                      iclocation,
                                      color: controller.appColors.grey,
                                    ).paddingOnly(left: 15.px, right: 15.px),
                                    padding: EdgeInsets.zero,
                                    contentPadding:
                                        EdgeInsets.only(left: 25.px),
                                    shadowColor:
                                        controller.appColors.transparent,
                                    labelText: Strings.unitaddress,
                                  ),
                                ),
                              ],
                            ).paddingOnly(top: 32.px),
                            Row(
                              children: [
                                Expanded(
                                  child: CommonTextField(
                                    isLable: true,
                                    readOnly: false,
                                    inputType: TextInputType.number,
                                    controller: controller.bedrooms,
                                    color: controller.appColors.transparent,
                                    prefixIcon: SvgPicture.string(
                                      icbedrooms,
                                      color: controller.appColors.grey,
                                    ).paddingOnly(left: 15.px, right: 15.px),
                                    padding: EdgeInsets.zero,
                                    contentPadding:
                                        EdgeInsets.only(left: 25.px),
                                    shadowColor:
                                        controller.appColors.transparent,
                                    labelText: Strings.bedroom,
                                  ),
                                ),
                                SizedBox(width: 16.px),
                                Expanded(
                                  child: CommonTextField(
                                    isLable: true,
                                    readOnly: false,
                                    inputType: TextInputType.number,
                                    controller: controller.bathrooms,
                                    color: controller.appColors.transparent,
                                    prefixIcon: SvgPicture.string(
                                      icbathroom,
                                      color: controller.appColors.grey,
                                    ).paddingOnly(left: 15.px, right: 15.px),
                                    padding: EdgeInsets.zero,
                                    contentPadding:
                                        EdgeInsets.only(left: 25.px),
                                    shadowColor:
                                        controller.appColors.transparent,
                                    labelText: Strings.bathroom,
                                  ),
                                ),
                              ],
                            ).paddingOnly(top: 32.px, bottom: 40.px),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    MyTextView(
                                      Strings.unitoccupied,
                                      textStyleNew: MyTextStyle(
                                        textColor: controller.appColors.black,
                                        textWeight: FontWeight.w400,
                                        textFamily: fontFamilyBold,
                                        textSize: 16.px,
                                      ),
                                    ).paddingOnly(right: 20.px),
                                    Switch(
                                      activeTrackColor:
                                          controller.appColors.appColor,
                                      inactiveTrackColor:
                                          controller.appColors.inactiveColor,
                                      inactiveThumbImage: Image.asset(
                                        ImagePath.uncheckmark,
                                        height: 60,
                                        width: 60,
                                      ).image,
                                      activeThumbImage: Image.asset(
                                        ImagePath.checkmark,
                                        height: 60,
                                        width: 60,
                                      ).image,
                                      activeColor: controller.appColors.white,
                                      value: controller.switchButton.value,
                                      onChanged: (value) {
                                        controller.switchButton.value =
                                            !controller.switchButton.value;
                                        controller.update();
                                      },
                                    ),
                                    MyTextView(
                                      controller.switchButton.value
                                          ? Strings.yes
                                          : Strings.no,
                                      textStyleNew: MyTextStyle(
                                        textColor: controller.appColors.black,
                                        textWeight: FontWeight.w400,
                                        textFamily: fontFamilyBold,
                                        textSize: 16.px,
                                      ),
                                    ).paddingOnly(left: 10.px),
                                  ],
                                ),
                                controller.isManually
                                    ? GestureDetector(
                                        onTap: (() {
                                          if (controller.getUnitInspection()) {
                                            controller.unitCannotInspected(
                                                context, Get.arguments);
                                          }
                                        }),
                                        child: MyTextView(
                                          Strings.unitcannitbeinspected,
                                          textStyleNew: MyTextStyle(
                                            textColor: controller
                                                    .getUnitInspection()
                                                ? controller.appColors.appColor
                                                : controller.appColors.border1,
                                            textWeight: FontWeight.w500,
                                            textFamily: fontFamilyBold,
                                            textSize: 16.px,
                                          ),
                                        ).paddingOnly(right: 10.px),
                                      )
                                    : CommonIconButton(
                                        title: Strings.unitUnInspectAble,
                                        radius: 100.px,
                                        width: 171.px,
                                        height: 44.px,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 24.px,
                                        ),
                                        textSize: 16.px,
                                        textWeight: FontWeight.w500,
                                        textFamily: fontFamilyRegular,
                                        textColor: AppColors.primerColor,
                                        color: controller.appColors.transparent,
                                        onTap: () {},
                                        border: Border.all(
                                            color: controller.appColors.black,
                                            width: 1.5),
                                        icon: blockIcon,
                                        iconColor: AppColors.primerColor,
                                        iconheigth: null,
                                      ).paddingSymmetric(vertical: 24.px),
                              ],
                            ),
                          ],
                        ).paddingOnly(
                            top: 32.px,
                            bottom: 30.px,
                            right: 24.px,
                            left: 24.px),
                      ),
                    ).paddingOnly(left: 32.px, right: 32.px, bottom: 10.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonButton(
                              title: Strings.quickPassInspection,
                              textColor: controller.appColors.appColor,
                              color: controller.appColors.transparent,
                              radius: 35.px,
                              textWeight: FontWeight.w600,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.px,
                                vertical: 10.px,
                              ),
                              textSize: 16.px,
                              border: Border.all(
                                  color: controller.appColors.border, width: 2),
                              onTap: () {
                                controller.dialogPassInspection();
                              }),
                          SizedBox(width: 24.px),
                          controller.isManually
                              ? Center(
                            child: CommonButton(
                              title: Strings.startInspection,
                              radius: 100.px,
                              width: 171.px,
                              height: 44.px,
                              padding: EdgeInsets.symmetric(
                                vertical: 15.px,
                                horizontal: 24.px,
                              ),
                              textSize: 16.px,
                              textWeight: FontWeight.w500,
                              textFamily: fontFamilyRegular,
                              textColor: controller.getUnitInspection()
                                  ? controller.appColors.black
                                  : controller.appColors.border1,
                              color: controller.getUnitInspection()
                                  ? controller.appColors.textPink
                                  : controller.appColors.black
                                  .withOpacity(0.11999999731779099),
                              onTap: () async {
                                Get.toNamed(AreasPage.routes);

                                // if (controller.getUnitInspection()) {
                                //   controller.getUnitJson();
                                //   Get.toNamed(
                                //     UnitBuildingStandardsScreen.routes,
                                //     preventDuplicates: false,
                                //     arguments: {
                                //       "unitinfo": controller.unitJson,
                                //       "propertyInfo":
                                //       Get.arguments['propertyInfo'],
                                //       "buildingInfo":
                                //       Get.arguments['buildingInfo'],
                                //       "buildingtype":
                                //       Get.arguments['buildingtype'],
                                //       "switchvalue":
                                //       controller.switchButton.value,
                                //       "certificatesInfo":
                                //       Get.arguments['certificatesInfo'],
                                //       "inspectorName":
                                //       Get.arguments['inspectorName'],
                                //       "inspectorDate":
                                //       Get.arguments['inspectorDate'],
                                //       "isManually": controller.isManually
                                //     },
                                //   );
                                // }
                              },
                            ).paddingSymmetric(vertical: 24.px),
                          )
                              : Center(
                            child: CommonButton(
                              title: Strings.startInspection,
                              radius: 100.px,
                              width: 171.px,
                              height: 44.px,
                              textSize: 16.px,
                              textWeight: FontWeight.w600,
                              textFamily: fontFamilyRegular,
                              textColor: controller.appColors.black,
                              color: controller.appColors.textPink,
                              onTap: () {
                                if (controller.getUnitInspection()) {
                                  controller.getUnitJson();
                                  Get.toNamed(
                                    UnitBuildingStandardsScreen.routes,
                                    preventDuplicates: false,
                                    arguments: {
                                      "isManually": controller.isManually,
                                      "unitinfo": controller.unitJson,
                                      "propertyInfo":
                                      Get.arguments['propertyInfo'],
                                      "buildingInfo":
                                      Get.arguments['buildingInfo'],
                                      "buildingtype":
                                      Get.arguments['buildingtype'],
                                      "switchvalue":
                                      controller.switchButton.value,
                                      "certificatesInfo":
                                      Get.arguments['certificatesInfo'],
                                      "inspectorName":
                                      Get.arguments['inspectorName'],
                                      "inspectorDate":
                                      Get.arguments['inspectorDate'],
                                    },
                                  );
                                }
                              },
                            ).paddingOnly(bottom: 24.px),
                          ),
                         /* CommonButton(
                            title: Strings.takeNotes,
                            color: controller.appColors.transparent,
                            textColor: controller.appColors.appColor,
                            border: Border.all(
                                color: controller.appColors.border, width: 2),
                            onTap: () {
                              controller.dialogIncompleteInspection();
                            },
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.px, vertical: 10.px),
                            textWeight: FontWeight.w500,
                            radius: 35.px,
                          ),*/
                        ],
                      ).paddingSymmetric(vertical: 32.px),

                    Row(
                      children: [
                        MyTextView(
                          Strings.propertyInformation,
                          textStyleNew: MyTextStyle(
                            textColor: controller.appColors.black,
                            textWeight: FontWeight.w400,
                            textFamily: fontFamilyBold,
                            textSize: 24.px,
                          ),
                        ).paddingOnly(right: 10.px),
                        Expanded(
                          child: Container(
                            height: 2.px,
                            color: AppColors().divider,
                          ),
                        ),
                      ],
                    ).paddingOnly(left: 32.px, right: 32.px, bottom: 20.px),
                    controller.isManually
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TitleheadMenu(
                                title: Strings.propertyName,
                                value:
                                    controller.propertyInfo['name'].toString(),
                              ),
                              Row(
                                children: [
                                  TitleheadMenu(
                                    title: Strings.city,
                                    value: controller.propertyInfo['city']
                                        .toString(),
                                  ).paddingOnly(right: 20.px),
                                  TitleheadMenu(
                                    title: Strings.propertyID,
                                    value: controller.propertyInfo['id']
                                        .toString(),
                                  ),
                                ],
                              ),
                            ],
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 20.px)
                        : CommonTextRow(
                            title: 'Property Name: ',
                            subTitle:
                                '${controller.propertyData.property?.name}',
                            imageString: icBuildingss,
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 20.px),
                    controller.isManually
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TitleheadMenu(
                                title: Strings.propertyAddress,
                                value: controller.propertyInfo['address']
                                    .toString(),
                              ),
                              Row(
                                children: [
                                  TitleheadMenu(
                                    title: Strings.state,
                                    value: controller.propertyInfo['state']
                                        .toString(),
                                  ).paddingOnly(right: 20.px),
                                  TitleheadMenu(
                                    title: Strings.zip,
                                    value: controller.propertyInfo['zip']
                                        .toString(),
                                  ),
                                ],
                              ),
                            ],
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 40.px)
                        : CommonTextRow(
                            title: 'Property Address: ',
                            subTitle:
                                '${controller.propertyData.property?.address1}, ${controller.propertyData.property?.city}, ${controller.propertyData.property?.state}, ${controller.propertyData.property?.zip}',
                            imageString: icLocation,
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 20.px),
                    controller.isManually
                        ? Row(
                            children: [
                              MyTextView(
                                Strings.buildingInformation,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.black,
                                  textWeight: FontWeight.w400,
                                  textFamily: fontFamilyBold,
                                  textSize: 24.px,
                                ),
                              ).paddingOnly(right: 10.px),
                              Expanded(
                                child: Container(
                                  height: 2.px,
                                  color: AppColors().divider,
                                ),
                              ),
                            ],
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 20.px)
                        : CommonTextRow(
                            title: 'Property ID: ',
                            subTitle: '${controller.propertyData.property?.id}',
                            imageString: hasTagIcon,
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 20.px),
                    controller.isManually
                        ? SizedBox.shrink()
                        : Row(
                            children: [
                              MyTextView(
                                Strings.buildingInformation,
                                textStyleNew: MyTextStyle(
                                  textColor: controller.appColors.black,
                                  textWeight: FontWeight.w400,
                                  textFamily: fontFamilyBold,
                                  textSize: 24.px,
                                ),
                              ).paddingOnly(right: 10.px),
                              Expanded(
                                child: Container(
                                  height: 2.px,
                                  color: AppColors().divider,
                                ),
                              ),
                            ],
                          ).paddingOnly(
                            left: 32.px,
                            right: 32.px,
                            bottom: 40.px,
                            top: 20.px),
                    controller.isManually
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TitleheadMenu(
                                title: Strings.buildingName,
                                value:
                                    controller.buildingInfo['name'].toString(),
                              ),
                              TitleheadMenu(
                                title: Strings.buildingType,
                                value: controller.buildingType.value.toString(),
                              ),
                            ],
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 20.px)
                        : Row(
                            children: [
                              Expanded(
                                child: CommonTextRow(
                                  title: 'Building Name: ',
                                  subTitle:
                                      '${controller.externalBuilding.building?.name}',
                                  imageString: icBuildings,
                                ),
                              ),
                              SizedBox(width: 16.px),
                              Expanded(
                                child: CommonTextRow(
                                  isImage: true,
                                  title: 'Year Constructed: ',
                                  subTitle:
                                      '${controller.externalBuilding.building?.constructedYear}',
                                  imageString: icCalender2,
                                ),
                              ),
                            ],
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 20.px),
                    controller.isManually
                        ? TitleheadMenu(
                            title: Strings.yearConstructed,
                            value: controller.buildingInfo['constructed_year']
                                .toString(),
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 40.px)
                        : CommonTextRow(
                            title: 'Building Type: ',
                            subTitle:
                                '${controller.externalBuilding.building?.buildingType?.name}',
                            imageString: icBuildings,
                          ).paddingOnly(
                            left: 32.px, right: 32.px, bottom: 40.px),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
