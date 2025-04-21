import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../commons/all.dart';
import '../../deficiencies_inside_screen/controller/deficiencies_inside_controller.dart';
import '../quic_fails_deficiency_detail_controller/QF_deficiency_detail_controller.dart';

class QuickFailDeficiencyDetailScreen
    extends GetView<QuickFailsDeficiencyDetailController> {
  const QuickFailDeficiencyDetailScreen({Key? key}) : super(key: key);
  static const String routes = '/deficiencyDetail';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuickFailsDeficiencyDetailController>(
      init: QuickFailsDeficiencyDetailController(),
      assignId: true,
      builder: (controller) {
        return BaseScreen(
          backgroundColor: controller.appColors.appBGColor,
          child: SafeArea(
            child: Column(
              children: [
                // Common App Bar
                CommonAppBar(
                  color: controller.appColors.transparent,
                  radius: 0.px,
                  onClickBack: () => Get.back(),
                ),
                Expanded(
                  child: SingleChildScrollView(
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
                                bottom: 32.px),
                          ),
                          MyTextView(
                            "Storage Component: is damaged, nonrepairable, or missing",
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
                              Spacer(),
                              CommonButton(
                                title: Strings.inspectionProcess,
                                border: Border.all(
                                    color: controller.appColors.black),
                                radius: 100.px,
                                width: 198.px,
                                height: 47.px,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.px, horizontal: 15.px),
                                textWeight: FontWeight.w500,
                                textFamily: fontFamilyRegular,
                                textColor: controller.appColors.appColor,
                                color: controller.appColors.transparent,
                                onTap: () {},
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyTextView(
                            Strings.deficienyCriteria,
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.black,
                              textWeight: FontWeight.bold,
                              textSize: 18.px,
                            ),
                          ).paddingOnly(right: 12.px),
                          MyTextView(
                            "[${Strings.deficienyCriteria
                            }]",
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.black,
                              textWeight: FontWeight.w200,
                              textSize: 16.px,
                            ),
                          ).paddingOnly(right: 12.px),

                          SizedBox(height: 16.px),

                          Row(
                            children: [
                              // Left card
                              Expanded(
                                child: Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.px)),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.px),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.access_time,
                                                color: controller
                                                    .appColors.appColor),
                                            SizedBox(width: 8.px),
                                            Text("${Strings.correctionTimeframeQF}:"),
                                            Spacer(),
                                            Text(
                                              Strings.thirtyDays,
                                              style: TextStyle(
                                                color: controller
                                                    .appColors.appColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 12.px),
                                        Row(
                                          children: [
                                            Icon(Icons.favorite,
                                                color: controller
                                                    .appColors.appColor),
                                            SizedBox(width: 8.px),
                                            Text("${Strings.HandSDetermination}:"),
                                            Spacer(),
                                            Text(
                                              Strings.moderateQF,
                                              style: TextStyle(
                                                color: controller
                                                    .appColors.appColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.px),
                              // Right card
                              Expanded(
                                child: _DeficiencyRadioCard(),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.px),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete, color: Colors.red),
                              SizedBox(width: 4.px),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  Strings.deleteChanges,
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(),
                          SizedBox(
                            height: 20,
                          ),

                          MyTextView(
                            Strings.takePhotoQF,
                            textStyleNew: MyTextStyle(
                              textColor: controller.appColors.black,
                              textWeight: FontWeight.bold,
                              textSize: 16.px,
                            ),
                          ).paddingOnly(right: 12.px),
                          SizedBox(
                            height: 20,
                          ),
                          // UploadPhotoCard(
                          //   appColors: controller.appColors,
                          //   onTap: () {
                          //     // TODO: Implement image picker or camera
                          //     print("Photo upload tapped");
                          //   },
                          // ),
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
                              child: controller.imageUploadStatus ==
                                      ImageUploadStatus.success
                                  ? ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: controller.imageList.length,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          children: [
                                            Stack(children: [
                                              SizedBox(
                                                height: 126.px,
                                                width: 126.px,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.px),
                                                  child: CachedNetworkImage(
                                                    imageUrl: controller
                                                        .imageList[index],
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ), /* Image.network(
                                                        controller
                                                            .imageList[index],
                                                        frameBuilder: (_,
                                                            image,
                                                            loadingBuilder,
                                                            __) {
                                                          if (loadingBuilder ==
                                                              null) {
                                                            return const SizedBox(
                                                              height: 100,
                                                              width: 100,
                                                              child: Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                            );
                                                          }
                                                          return image;
                                                        },
                                                        loadingBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Widget image,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null)
                                                            return image;
                                                          return SizedBox(
                                                            height: 100,
                                                            width: 100,
                                                            child: Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                value: loadingProgress
                                                                            .expectedTotalBytes !=
                                                                        null
                                                                    ? loadingProgress
                                                                            .cumulativeBytesLoaded /
                                                                        loadingProgress
                                                                            .expectedTotalBytes!
                                                                    : null,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                        headers: {
                                                          "Host":
                                                              "${controller.getStorageData.readString(controller.getStorageData.baseURL)}"
                                                        },
                                                        fit: BoxFit.cover,
                                                        scale: 1.0,
                                                        color: controller
                                                                    .selectedItem ==
                                                                "null"
                                                            ? controller
                                                                .appColors.black
                                                                .withOpacity(
                                                                    0.07999999821186066)
                                                            : null,
                                                      ),*/
                                                  /*Image.file(
                                                        File(controller
                                                                .sendImagesList[
                                                            index]),
                                                        fit: BoxFit.cover,
                                                        color: controller
                                                                    .selectedItem ==
                                                                "null"
                                                            ? controller
                                                                .appColors.black
                                                                .withOpacity(
                                                                    0.07999999821186066)
                                                            : null,
                                                      )*/
                                                ),
                                              ),
                                              Positioned(
                                                right: 2,
                                                top: 2,
                                                child: GestureDetector(
                                                    onTap: () async {
                                                      if (controller.imageList
                                                              .length >
                                                          1) {
                                                        controller.imageList
                                                            .removeAt(index);
                                                      } else {
                                                        await controller
                                                            .removeImage(index);
                                                      }
                                                      controller.update();
                                                    },
                                                    child: SvgPicture.string(
                                                      icDelete,
                                                      color: controller
                                                                  .selectedItem ==
                                                              "null"
                                                          ? controller
                                                              .appColors.black
                                                              .withOpacity(
                                                                  0.07999999821186066)
                                                          : null,
                                                    )),
                                              )
                                            ]),
                                            if (controller.imageList.length -
                                                    1 ==
                                                index) ...[
                                              GestureDetector(
                                                onTap: () {
                                                  controller.imagePicker();
                                                },
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 80.px,
                                                        height: 80.px,
                                                        // decoration: BoxDecoration(
                                                        //     borderRadius: BorderRadius.circular(10.px),
                                                        //     border: Border.all(
                                                        //         color: controller.appColors.border1, width: 2)),
                                                        child: Center(
                                                          child: SvgPicture.string(
                                                              icAdd,
                                                              // height: 45.px,
                                                              color: controller
                                                                          .selectedItem ==
                                                                      "null"
                                                                  ? controller
                                                                      .appColors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.07999999821186066)
                                                                  : null
                                                              // fit: BoxFit.cover,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10.px),
                                                      MyTextView(
                                                        Strings.addPicture,
                                                        textStyleNew:
                                                            MyTextStyle(
                                                          textColor: controller
                                                                      .selectedItem ==
                                                                  "null"
                                                              ? controller
                                                                  .appColors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.07999999821186066)
                                                              : controller
                                                                  .appColors
                                                                  .appColor,
                                                          textSize: 14.px,
                                                          textWeight:
                                                              FontWeight.w500,
                                                          textFamily:
                                                              fontFamilyRegular,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ).paddingSymmetric(
                                                  horizontal: 32.px)
                                            ],
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return SizedBox(
                                          width: 32.px,
                                        );
                                      },
                                    )
                                  : controller.imageUploadStatus ==
                                          ImageUploadStatus.initial
                                      ? GestureDetector(
                                          onTap: () {
                                            controller.imagePicker();
                                          },
                                          child: Container(
                                            color: Colors.white,
                                            child: Column(
                                              children: [
                                                controller.selectedItem ==
                                                        "null"
                                                    ? Center(
                                                        child:
                                                            SvgPicture.string(
                                                          icImage,
                                                          width: 80.px,
                                                          height: 80.px,
                                                          color: controller
                                                              .appColors.black
                                                              .withOpacity(
                                                                  0.07999999821186066),
                                                        ),
                                                      )
                                                    : Center(
                                                        child:
                                                            SvgPicture.string(
                                                          icImage,
                                                          width: 80.px,
                                                          height: 80.px,
                                                        ),
                                                      ),
                                                SizedBox(
                                                  height: 16.px,
                                                ),
                                                Flexible(
                                                  child: Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text:
                                                              Strings.takeOrUpload,
                                                          style: MyTextStyle(
                                                            textSize: 16.px,
                                                            textWeight:
                                                                FontWeight.w600,
                                                            textColor: controller
                                                                        .selectedItem ==
                                                                    "null"
                                                                ? controller
                                                                    .appColors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.07999999821186066)
                                                                : controller
                                                                    .appColors
                                                                    .appColor,
                                                            textFamily:
                                                                fontFamilyBold,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text:
                                                              Strings.photoOfThe,
                                                          style: MyTextStyle(
                                                            textSize: 16.px,
                                                            textColor: controller
                                                                        .selectedItem ==
                                                                    "null"
                                                                ? controller
                                                                    .appColors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.07999999821186066)
                                                                : controller
                                                                    .appColors
                                                                    .black,
                                                            textWeight:
                                                                FontWeight.w400,
                                                            textFamily:
                                                                fontFamilyRegular,
                                                          ),
                                                        ),
                                                        TextSpan(
                                                          text: Strings.deficiency,
                                                          style: MyTextStyle(
                                                            textSize: 16.px,
                                                            textWeight:
                                                                FontWeight.w600,
                                                            textColor: controller
                                                                        .selectedItem ==
                                                                    "null"
                                                                ? controller
                                                                    .appColors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.07999999821186066)
                                                                : controller
                                                                    .appColors
                                                                    .appColor,
                                                            textFamily:
                                                                fontFamilyBold,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Center(
                                          child: CircularProgressIndicator(),
                                        ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),

                          Container(
                            height: 2.px,
                            color: controller.selectedItem == "null"
                                ? controller.appColors.textField
                                : AppColors().divider,
                          ).paddingSymmetric(vertical: 32.px),

                          Row(
                            children: [
                              MyTextView(
                                Strings.comments,
                                textStyleNew: MyTextStyle(
                                  textSize: 24.px,
                                  textWeight: FontWeight.w400,
                                  textColor: controller.selectedItem == "null"
                                      ? controller.appColors.black
                                          .withOpacity(0.08)
                                      : controller.appColors.black,
                                  textFamily: fontFamilyRegular,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3.8,
                              ),
                              CommonButton(
                                title: Strings.saveChanges,
                                textColor: controller.selectedItem != "null" &&
                                        controller.visibleBtn &&
                                        controller
                                            .commentController.text.isNotEmpty
                                    ? controller.appColors.white
                                    : controller.appColors.border1,
                                color: controller.selectedItem != "null" &&
                                        controller.visibleBtn &&
                                        controller
                                            .commentController.text.isNotEmpty
                                    ? controller.appColors.appColor
                                    : controller.appColors.black
                                        .withOpacity(0.12),
                                radius: 35.px,
                                textWeight: FontWeight.w600,
                                textSize: 16.px,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 24.px, vertical: 12.px),
                                onTap: () async {
                                  if (controller.visibleBtn && controller.commentController.text.isNotEmpty) {
                                    await controller.saveChanges();
                                    // INSTEAD of finishAndGoBackToListing(), just return the index:
                                    Get.back(result: {
                                      "deficiencyIndex": controller.deficiencyIndex,
                                    });
                                  }
                                },
                                // onTap: () async {
                                //   if (controller.visibleBtn &&
                                //       controller
                                //           .commentController.text.isNotEmpty) {
                                //     await controller.saveChanges();
                                //     // Instead of Get.back(), call the new method
                                //     controller.finishAndGoBackToListing();
                                //
                                //   }
                                // },
                              ).paddingSymmetric(vertical: 48.px),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: CommonTextField(
                                  isLable: true,
                                  padding: EdgeInsets.zero,
                                  controller: controller.commentController,
                                  color: controller.appColors.transparent,
                                  prefixIcon: SvgPicture.string(
                                    icMsg,
                                    color: controller.selectedItem == "null"
                                        ? controller.appColors.border1
                                        : controller.appColors.lightText,
                                  ).paddingOnly(left: 15.px),
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      // controller.listen();
                                    },
                                    child: SvgPicture.string(
                                      icMike,
                                      color: controller.selectedItem == "null"
                                          ? controller.appColors.border1
                                          : controller.isListening.value
                                              ? controller.appColors.appColor
                                              : controller.appColors.lightText,
                                    ),
                                  ),
                                  onChange: (str) {
                                    if (str.isNotEmpty &&
                                        controller
                                            .dateController.text.isNotEmpty &&
                                        controller.imageList.isNotEmpty) {
                                      controller.visibleBtn = true;
                                    } else {
                                      controller.visibleBtn = false;
                                    }
                                    controller.update();
                                  },
                                  labelText: "${Strings.comments}*",
                                  hintText: Strings.addComments,
                                  hintColor: controller.selectedItem == "null"
                                      ? controller.appColors.border1
                                      : null,
                                  textColor: controller.selectedItem == "null"
                                      ? controller.appColors.border1
                                      : null,
                                  isLableColor:
                                      controller.selectedItem == "null"
                                          ? controller.appColors.border1
                                          : null,
                                  borderColor: controller.selectedItem == "null"
                                      ? controller.appColors.border1
                                      : null,
                                ),
                              ),
                              SizedBox(width: 16.px),
                              SizedBox(
                                width: 180.px,
                                child: CommonTextField(
                                  isLable: true,
                                  readOnly: true,
                                  onTap: () {
                                    controller.selectDate();
                                  },
                                  padding: EdgeInsets.zero,
                                  contentPadding: EdgeInsets.only(left: 16.px),
                                  controller: controller.dateController,
                                  color: controller.appColors.transparent,
                                  suffixIcon: SvgPicture.string(
                                    icCalender2,
                                    color: controller.selectedItem == "null"
                                        ? controller.appColors.border1
                                        : controller.appColors.lightText,
                                  ),
                                  shadowColor: controller.appColors.transparent,
                                  hintText: "mm/dd/yyyy*",
                                  hintColor: controller.selectedItem == "null"
                                      ? controller.appColors.border1
                                      : null,
                                  textColor: controller.selectedItem == "null"
                                      ? controller.appColors.border1
                                      : null,
                                  isLableColor:
                                      controller.selectedItem == "null"
                                          ? controller.appColors.border1
                                          : null,
                                  borderColor: controller.selectedItem == "null"
                                      ? controller.appColors.border1
                                      : null,
                                  onChange: (str) {
                                    if (str.isNotEmpty &&
                                        controller.commentController.text
                                            .isNotEmpty) {
                                      controller.visibleBtn = true;
                                      controller.update();
                                    }
                                  },
                                  labelText: Strings.completedDate,
                                ),
                              ),
                            ],
                          ).paddingSymmetric(vertical: 32.px),
                        ],
                      ),
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

class _DeficiencyRadioCard extends StatefulWidget {
  @override
  State<_DeficiencyRadioCard> createState() => _DeficiencyRadioCardState();
}

class _DeficiencyRadioCardState extends State<_DeficiencyRadioCard> {
  String selectedOption = Strings.deficiencyPresent;

  Widget _buildOption(String title) {
    final isSelected = selectedOption == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = title;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.black.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(12.px),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.px,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
            Radio<String>(
              value: title,
              groupValue: selectedOption,
              onChanged: (val) {
                setState(() {
                  selectedOption = val!;
                });
              },
              activeColor: Colors.pink,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
      child: Column(
        children: [
          _buildOption("${Strings.correctionTimeframeQF}"),
          _buildOption("${Strings.inconclusiveQF}"),
        ],
      ),
    );
  }
}

class UploadPhotoCard extends StatelessWidget {
  final VoidCallback onTap;
  final AppColors appColors;

  const UploadPhotoCard({
    Key? key,
    required this.onTap,
    required this.appColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 24.px),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.px),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12.px),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.px),
              ),
              child: Icon(
                Icons.image_outlined,
                size: 40.px,
                color: appColors.appColor,
              ),
            ),
            SizedBox(height: 12.px),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 16.px, color: Colors.black),
                children: [
                  TextSpan(
                    text: "${Strings.takeOrUpload} ",
                    style: TextStyle(
                      color: appColors.appColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: Strings.photoOfThe1),
                  TextSpan(
                    text: Strings.deficiency1,
                    style: TextStyle(
                      color: appColors.appColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
