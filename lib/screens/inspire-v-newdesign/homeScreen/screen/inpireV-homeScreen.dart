import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:public_housing/commons/all.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../commons/appcolors.dart';
import '../../../../commons/common_widgets/base_widgets.dart';
import '../../../../commons/common_widgets/shadow_container_widgets.dart';
import '../controller/inpireV_home_controller.dart';

class InspireVHomeScreen extends StatelessWidget {
  const InspireVHomeScreen({Key? key}) : super(key: key);
  static const String routes = '/inspireVHome';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InspireVHomeScreenController>(
      // Instantiate your controller (or use Get.find<>() if you put it elsewhere)
      init: Get.put(InspireVHomeScreenController()),
      builder: (controller) {
        return BaseScreen(
          backgroundColor: controller.appColors.appBGColor,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ShadowContainer(
                  radius: 0,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  elevation: 3.0,
                  child: Container(
                    color: AppColors().white,
                    height: 160.px,
                    child: Padding(
                      padding: EdgeInsets.all(32.px),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImagePath.logo,
                                width: 182.px,
                                height: 40.63.px,
                              ),
                              Spacer(),
                              MyTextView(
                                Strings.section,
                                textStyleNew: MyTextStyle(
                                  textColor: AppColors.primerColor,
                                  textWeight: FontWeight.w600,
                                  textFamily: fontFamilyBold,
                                  textSize: 32.px,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.popupKey.currentState
                                      ?.showButtonMenu();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: MyTextView(
                                                    "Matt Gilson",
                                                    textStyleNew: MyTextStyle(
                                                      textColor: controller
                                                          .appColors.lightText,
                                                      textWeight:
                                                      FontWeight.w600,
                                                      textFamily:
                                                      fontFamilyBold,
                                                      textSize: 16.px,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ).paddingOnly(bottom: 2.px),
                                            MyTextView(
                                              "Client Name",
                                              isMaxLineWrap: true,
                                              textStyleNew: MyTextStyle(
                                                textColor: controller
                                                    .appColors.lightText,
                                                textWeight: FontWeight.w400,
                                                textFamily: fontFamilyMedium,
                                                textSize: 14.px,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        PopupMenuButton<int>(
                                          key: controller.popupKey,
                                          color: controller.appColors.white,
                                          icon: SvgPicture.string(
                                            icDownArrow,
                                            height: 24.px,
                                          ),
                                          onSelected: (int value) => controller
                                              .actionPopUpItemSelected(value),
                                          itemBuilder: (context) {
                                            return <PopupMenuEntry<int>>[
                                              PopupMenuItem(
                                                value: 0,
                                                child: ListTile(
                                                  leading:
                                                  SvgPicture.string(icEdit),
                                                  title: MyTextView(
                                                    Strings.editProfile,
                                                    textStyleNew: MyTextStyle(
                                                        textSize: 16.px,
                                                        textColor:
                                                        AppColors().black,
                                                        textWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 1,
                                                child: ListTile(
                                                  leading:
                                                  SvgPicture.string(icCopy),
                                                  title: MyTextView(
                                                    Strings.inspectionHistory,
                                                    textStyleNew: MyTextStyle(
                                                        textSize: 16.px,
                                                        textColor:
                                                        AppColors().black,
                                                        textWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 2,
                                                child: ListTile(
                                                  leading:
                                                  SvgPicture.string(icBook),
                                                  title: MyTextView(
                                                    Strings.nSPIREStandards,
                                                    textStyleNew: MyTextStyle(
                                                        textSize: 16.px,
                                                        textColor:
                                                        AppColors().black,
                                                        textWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 3,
                                                child: ListTile(
                                                  leading: SvgPicture.string(
                                                      changeSectionIcon),
                                                  title: MyTextView(
                                                    Strings.changeSection1,
                                                    textStyleNew: MyTextStyle(
                                                        textSize: 16.px,
                                                        textColor:
                                                        AppColors().black,
                                                        textWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: 4,
                                                child: ListTile(
                                                  leading: SvgPicture.string(
                                                      icLogout),
                                                  title: MyTextView(
                                                    Strings.logOut,
                                                    textStyleNew: MyTextStyle(
                                                        textSize: 16.px,
                                                        textColor:
                                                        AppColors().black,
                                                        textWeight:
                                                        FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ];
                                          },
                                        ),
                                        const SizedBox()
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              CommonIconButton(
                                title: Strings.inspectManually,
                                radius: 100.px,
                                width: 191.px,
                                height: 44.px,
                                color: AppColors.primerColor,
                                padding:
                                EdgeInsets.symmetric(horizontal: 24.px),
                                textSize: 16.px,
                                textWeight: FontWeight.w500,
                                textFamily: fontFamilyRegular,
                                onTap: () {
                                  // Get.toNamed(
                                  //     ManualUnitInspectionScreen.routes);
                                },
                                iconColor: controller.appColors.white,
                                icon: inspectIcon,
                                iconheigth: 20.px,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ).paddingOnly(bottom: 4),

                Row(
                  children: [
                    CommonIconButton(
                      title: Strings.selectTimeframe,
                      radius: 100.px,
                      width: 191.px,
                      height: 44.px,
                      color: controller.appColors.transparent,
                      padding: EdgeInsets.symmetric(horizontal: 24.px),
                      textSize: 16.px,
                      border: Border.all(
                          color: controller.status == PropertyStatus.scheduled
                              ? controller.appColors.black
                              : AppColors().border1),
                      textColor: controller.status == PropertyStatus.scheduled
                          ? AppColors.primerColor
                          : AppColors().border1,
                      textWeight: FontWeight.w500,
                      textFamily: fontFamilyRegular,
                      onTap: () {
                        if (controller.status == PropertyStatus.scheduled) {
                          navigateToDateTime(controller);
                          controller.dateRange = PickerDateRange(null, null);
                          controller.startDate = '';
                          controller.endDate = '';
                          controller.confirmSelectedDates();
                        }
                      },
                      iconColor: controller.status == PropertyStatus.scheduled
                          ? AppColors.primerColor
                          : AppColors().border1,
                      icon: icCalender1,
                      iconheigth: 20.px,
                    ),
                    Spacer(),
                    Expanded(
                      flex: 0,
                      child: SizedBox(
                        // width: 250.px,
                        height: 48.px,
                        child: SegmentedButton<PropertyStatus>(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateColor.resolveWith(
                                    (Set<WidgetState> states) {
                                  return states.contains(WidgetState.selected)
                                      ? controller.appColors.pinkcolor
                                      : controller.appColors.transparent;
                                }),
                            foregroundColor: WidgetStateColor.resolveWith(
                                    (Set<WidgetState> states) {
                                  return states.contains(WidgetState.selected)
                                      ? Colors.black
                                      : controller.appColors.border1;
                                }),
                            side: WidgetStateBorderSide.resolveWith((states) {
                              return BorderSide(
                                  color: states.contains(WidgetState.selected)
                                      ? Colors.black
                                      : Colors.grey);
                            }),
                          ),
                          segments: const <ButtonSegment<PropertyStatus>>[
                            ButtonSegment<PropertyStatus>(
                              value: PropertyStatus.scheduled,
                              label: Text(Strings.scheduled),
                            ),
                            ButtonSegment<PropertyStatus>(
                              value: PropertyStatus.completed,
                              label: Text(Strings.completed),
                            ),
                          ],
                          selected: <PropertyStatus>{controller.status},
                          onSelectionChanged:
                              (Set<PropertyStatus> newSelection) {
                            controller.status = newSelection.first;
                            controller.update();
                          },
                        ),
                      ),
                    ),
                  ],
                ).paddingOnly(left: 32.px, right: 32.px, top: 38.px),
// … right after your segmented buttons …

                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.px, vertical: 38.px),
                  child: Row(
                    children: [
                      Text(
                        "Today Inspections | March 25",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 24.px,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(width: 15.px),
                      Expanded(
                        child: Divider(
                          color: controller.appColors.divider,
                          thickness: 1.px,
                        ),
                      ),
                    ],
                  ),
                ),

// #### Begin expandable list ####
                Expanded(
                  child: ListView.builder(
                    padding:
                    EdgeInsets.symmetric(horizontal: 16.px, vertical: 8.px),
                    itemCount: controller.inspections.length,
                    itemBuilder: (_, idx) {
                      final item = controller.inspections[idx];
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.only(bottom: 12.px),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.px),
                        ),
                        child: ExpansionTile(
                          key: ValueKey(idx),
                          // keeps state per tile
                          tilePadding: EdgeInsets.symmetric(
                              horizontal: 16.px, vertical: 12.px),
                          childrenPadding: EdgeInsets.symmetric(
                              horizontal: 16.px, vertical: 12.px),
                          initiallyExpanded: item.isExpanded,
                          onExpansionChanged: (open) =>
                              controller.toggleExpansion(idx, open),

                          // ─── collapsed header ───────────────────────
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Address + location
                              RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration
                                        .underline, // ← underline here
                                  ),
                                  children: [
                                    TextSpan(text: item.address),
                                    TextSpan(
                                      text: ' – ${item.location}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.px,
                                        color: Colors.grey[700],
                                        decoration: TextDecoration
                                            .underline, // ← and here to be safe
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 8),

                              // tenant + tag
                              Row(
                                children: [
                                  Text(
                                    item.tenantName,
                                    style: TextStyle(
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.px, vertical: 4.px),
                                    decoration: BoxDecoration(
                                      color: Colors.green[50],
                                      borderRadius:
                                      BorderRadius.circular(12.px),
                                    ),
                                    child: Text(
                                      item.tagLabel,
                                      style: TextStyle(
                                        fontSize: 12.px,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green[800],
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // date + time
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 16.px,color: AppColors.primerColor,),
                                  const SizedBox(width: 4),
                                  Text(
                                    DateFormat('MM/dd/yyyy').format(item.date),
                                    style: TextStyle(fontSize: 14.px),
                                  ),
                                  const SizedBox(width: 16),

                                  SvgPicture.string(clockIcon,height: 16.px,width: 16.px,),
                                  const SizedBox(width: 4),
                                  Text(
                                    item.timeRange,
                                    style: TextStyle(fontSize: 14.px),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // ─── expanded body ───────────────────────────
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Tenant row
                                Text('Tenant Name • Tenant ID',
                                    style: TextStyle(
                                      fontSize: 12.px,
                                      color: Colors.black,
                                    )),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      item.tenantName,
                                      style: TextStyle(
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Icon(Icons.phone,
                                        size: 16.px, color: Colors.green),
                                    const SizedBox(width: 4),
                                    GestureDetector(
                                      onTap: () {
                                        /* dial number */
                                      },
                                      child: Text(
                                        item.tenantPhone,
                                        style: TextStyle(
                                          fontSize: 14.px,
                                          color: Colors.green,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 12.px),

                                // Landlord row
                                Text('Landlord Name • Tenant ID',
                                    style: TextStyle(
                                      fontSize: 12.px,
                                      color: Colors.black,
                                    )),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      item.landlordName,
                                      style: TextStyle(
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Icon(Icons.phone,
                                        size: 16.px, color: Colors.green),
                                    const SizedBox(width: 4),
                                    GestureDetector(
                                      onTap: () {
                                        /* dial number */
                                      },
                                      child: Text(
                                        item.landlordPhone,
                                        style: TextStyle(
                                          fontSize: 14.px,
                                          color: Colors.green,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                Text(
                                  'Comments',
                                  style: TextStyle(
                                    fontSize: 14.px,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                TextField(
                                  readOnly: false,
                                  controller: TextEditingController(
                                      text: item.comments.isEmpty
                                          ? ''
                                          : item.comments),
                                  decoration: InputDecoration(
                                    hintText: item.comments.isEmpty
                                        ? 'Add a comment…'
                                        : null,
                                    prefixIcon: Icon(Icons.comment,
                                        size: 16.px, color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(24.px),
                                      borderSide:
                                      const BorderSide(color: Colors.black),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    isDense: true,
                                    contentPadding:
                                    EdgeInsets.symmetric(vertical: 12.px),
                                  ),
                                ),

                                const SizedBox(height: 32),

                                // Inspection Notes input
                                Text('Inspection Notes',
                                    style: TextStyle(
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.bold,
                                    )),
                                const SizedBox(height: 4),
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Add Notes',
                                    prefixIcon: const Icon(Icons.comment),
                                    suffixIcon: const Icon(Icons.mic),
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(24.px),
                                      borderSide:
                                      const BorderSide(color: Colors.black),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                  ),
                                  onChanged: (val) {
                                    item.comments = val;
                                  },
                                ),

                                const SizedBox(height: 16),

                                // Bedrooms control
                                // … inside your ExpansionTile’s children Column, instead of two separate rows …

// ─── Bedrooms & Bathrooms side by side ─────────────────────
                                Row(
                                  children: [
                                    // Bedrooms block
                                    Row(
                                      children: [
                                        Icon(Icons.bed, size: 20.px,color:AppColors.primerColor),
                                        SizedBox(width: 4.px),
                                        Text(
                                          'Bedrooms',
                                          style: TextStyle(
                                            color: AppColors().appColor,
                                            fontSize: 14.px,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          icon: Icon(
                                            Icons.remove,
                                            size: 20.px,
                                            color: AppColors().appColor,
                                          ),
                                          onPressed: () =>
                                              controller.decrementBedrooms(idx),
                                        ),
                                        SizedBox(width: 8.px),
                                        Text(
                                          '${item.bedrooms}',
                                          style: TextStyle(
                                            fontSize: 14.px,
                                            color: AppColors().appColor,
                                          ),
                                        ),
                                        SizedBox(width: 8.px),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          icon: Icon(
                                            Icons.add,
                                            size: 20.px,
                                            color: AppColors().appColor,
                                          ),
                                          onPressed: () =>
                                              controller.incrementBedrooms(idx),
                                        ),
                                      ],
                                    ),

                                    // Vertical divider
                                    Container(
                                      width: 1.px,
                                      height: 32.px,
                                      color: controller.appColors.divider,
                                      // or Colors.grey
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 16.px),
                                    ),

                                    // Bathrooms block
                                    Row(
                                      children: [

                                        SvgPicture.string(bathroomIcon,height: 20.px,width: 20.px,),
                                        SizedBox(width: 4.px),
                                        Text(
                                          'Bathrooms',
                                          style: TextStyle(
                                            color: AppColors().appColor,
                                            fontSize: 14.px,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 8.px),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          icon: Icon(
                                            Icons.remove,
                                            size: 20.px,
                                            color: AppColors().appColor,
                                          ),
                                          onPressed: () => controller
                                              .decrementBathrooms(idx),
                                        ),
                                        SizedBox(width: 8.px),
                                        Text(
                                          '${item.bathrooms}',
                                          style: TextStyle(
                                            fontSize: 14.px,
                                            color: AppColors().appColor,
                                          ),
                                        ),
                                        SizedBox(width: 8.px),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          icon: Icon(
                                            Icons.add,
                                            size: 20.px,
                                            color: AppColors().appColor,
                                          ),
                                          onPressed: () => controller
                                              .incrementBathrooms(idx),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                // Action buttons
                                Row(
                                  children: [
                                    OutlinedButton(
                                      onPressed: () => _showNoShowDialog(
                                          Get.context!, controller),
                                      child: Text(
                                        'No Show',
                                        style: TextStyle(
                                          color: AppColors().appColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 18),
                                    OutlinedButton(
                                      onPressed: () =>_quickPassDialog( Get.context!, controller),
                                      child: Text(
                                        'Quick Pass',
                                        style: TextStyle(
                                          color: AppColors().appColor,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    CommonButton(
                                      title: "Start Inspection",
                                      onTap: () {controller.onStartInpectionTap();},
                                      color: AppColors().appColor,
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
// #### End expandable list ####
              ],
            ),
          ),
        );
      },
    );
  }

  void navigateToDateTime(controller) {
    showModalBottomSheet(
      context: Get.context!,
      backgroundColor: controller.appColors.white,
      showDragHandle: true,
      useSafeArea: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(28.px),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            color: controller.appColors.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.px),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MyTextView(
                        Strings.selectDates,
                        textStyleNew: MyTextStyle(
                            textSize: 32.px,
                            textColor: controller.appColors.black,
                            textWeight: FontWeight.w400),
                      ),
                      Spacer(),
                      CommonButton(
                        title: Strings.today,
                        textColor: AppColors.primerColor,
                        textWeight: FontWeight.w500,
                        textSize: 16.px,
                        onTap: () {
                          controller.startDate =
                              controller.todayDateGet(DateTime.now());
                          controller.startDateTime = DateTime.now();
                          controller.endDateTime = DateTime.now();
                          controller.getDailySchedulesData();
                          Get.back();
                          controller.update();
                        },
                        width: 92.px,
                        height: 44.px,
                        color: controller.appColors.transparent,
                        border: Border.all(color: controller.appColors.black),
                      ),
                    ],
                  ).paddingAll(24.px),
                  Container(height: 2.px, color: controller.appColors.divider),
                  Flexible(
                    child: SfDateRangePicker(
                      rangeSelectionColor: controller.appColors.greyColor,
                      initialSelectedDate: DateTime.now(),
                      // minDate: DateTime.now(),
                      minDate: DateTime(2020),
                      onSelectionChanged:
                          (DateRangePickerSelectionChangedArgs args) {
                        setState(() {
                          if (args.value.startDate != null) {
                            controller.startDate =
                                controller.todayDateGet(args.value.startDate);
                            controller.startDateTime = args.value.startDate;
                          } else {
                            controller.startDate = '';
                            controller.confirmSelectedDates();
                          }

                          if (args.value.endDate != null) {
                            controller.endDate =
                                controller.todayDateGet(args.value.endDate);
                            controller.endDateTime = args.value.endDate;
                          } else {
                            controller.endDate = '';
                            controller.confirmSelectedDates();
                          }
                          if (args.value.startDate != null ||
                              args.value.endDate != null) {
                            controller.confirmSelectedDates();
                          }
                        });
                      },
                      selectionShape: DateRangePickerSelectionShape.rectangle,
                      selectionRadius: 50.0,
                      selectionMode: DateRangePickerSelectionMode.range,
                      initialSelectedRange: controller.dateRange,
                      selectionTextStyle: const TextStyle(color: Colors.white),
                      startRangeSelectionColor: AppColors.primerColor,
                      endRangeSelectionColor: AppColors.primerColor,
                    ),
                  ),
                  Container(height: 2.px, color: controller.appColors.divider),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextView(
                            Strings.from,
                            textStyleNew: MyTextStyle(
                                textSize: 20.px,
                                textColor: controller.appColors.textcolor,
                                textWeight: FontWeight.w400),
                          ),
                          MyTextView(
                            controller.startDate,
                            textStyleNew: MyTextStyle(
                                textSize: 24.px,
                                textColor: controller.appColors.black,
                                textWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextView(
                            controller.endDate == ''
                                ? Strings.selectDate
                                : Strings.to,
                            textStyleNew: MyTextStyle(
                                textSize: 20.px,
                                textColor: controller.appColors.textcolor,
                                textWeight: FontWeight.w400),
                          ),
                          MyTextView(
                            controller.endDate,
                            textStyleNew: MyTextStyle(
                                textSize: 24.px,
                                textColor: controller.appColors.black,
                                textWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      CommonButton(
                        title: Strings.confirmDates,
                        textColor: controller.isDateSelected
                            ? controller.appColors.white
                            : controller.appColors.border1,
                        textWeight: FontWeight.w500,
                        textSize: 16.px,
                        onTap: controller.isDateSelected
                            ? () {
                          controller.selectedDateFilterData();
                        }
                            : () {},
                        width: 152.px,
                        height: 44.px,
                        color: controller.isDateSelected
                            ? AppColors.primerColor
                            : controller.appColors.black.withOpacity(.12),
                      ),
                    ],
                  ).paddingAll(24.px)
                ],
              ),
            ),
          );
        });
      },
    );
  }

// ─── in your screen/widget class ────────────────────────────────────────────────

  void _showNoShowDialog(BuildContext ctx, InspireVHomeScreenController ctl) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (_) =>
          Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.px, vertical: 20.px),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Title ───────────────────────────────────────
                  Text(
                    'No Show',
                    style: TextStyle(
                        fontSize: 32.px, fontWeight: FontWeight.w600,fontFamily: "Roboto"),
                  ),
                  SizedBox(height: 20.px),

                  // ── Reactive Carousel ───────────────────────────
                  GetBuilder<InspireVHomeScreenController>(
                    builder: (c) {
                      return Container(
                        height: 100.px,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12.px),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.px),
                          child: c.imageList.isEmpty
                          // ── State 1: Before any image ─────────────
                              ? GestureDetector(
                            onTap: c.imagePicker,
                            child: Container(
                              height: 76.px,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60.px,
                                    alignment: Alignment.center,
                                    child: SvgPicture.string(
                                      addCameraIcon,
                                      width: 32.px,
                                      height: 32.px,
                                      color: AppColors.primerColor,
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 8.px),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Picture required',
                                            style: TextStyle(
                                              fontSize: 16.px,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primerColor,
                                            ),
                                          ),
                                          Text(
                                            'before continue',
                                            style:
                                            TextStyle(fontSize: 14.px),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          // ── State 2: After images added ────────────
                              : Row(
                            children: [
                              // ── Scrollable add + thumbs ───────────────────────
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      // 1) Add tile + divider
                                      GestureDetector(
                                        onTap: c.imagePicker,
                                        child: Container(
                                          height: 76.px,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.px),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                8.px),
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.string(
                                                addCameraIcon,
                                                width: 32.px,
                                                height: 32.px,
                                                color: AppColors.primerColor,
                                              ),
                                              SizedBox(width: 8.px),
                                              Container(
                                                width: 1.px,
                                                height: 48.px,
                                                color: Colors.grey.shade300,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 8.px),

                                      // 2) Thumbnails
                                      for (var i = 0; i <
                                          c.imageList.length; i++) ...[
                                        Stack(
                                          children: [
                                            Container(
                                              width: 76.px,
                                              height: 76.px,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(8.px),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(8.px),
                                                child: c.imageList[i]
                                                    .startsWith('http')
                                                    ? CachedNetworkImage(
                                                  imageUrl: c.imageList[i],
                                                  fit: BoxFit.cover,
                                                )
                                                    : Image.file(
                                                  File(c.imageList[i]),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 4.px,
                                              right: 4.px,
                                              child: GestureDetector(
                                                onTap: () => c.removeImage(i),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding: EdgeInsets.all(2.px),
                                                  child: Icon(
                                                      Icons.close, size: 16.px,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 8.px),
                                      ],
                                    ],
                                  ),
                                ),
                              ),

                              // ── Spacer pushes ✔ to the far right ───────────────
                              Spacer(),

                              // 3) Confirm tile
                              GestureDetector(
                                onTap: () => Navigator.of(Get.context!).pop(),
                                child: Center(
                                  child: SvgPicture.string(
                                    successIcon,
                                    width: 32.px,
                                    height: 32.px,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 24.px),

                  // ── Action Buttons ────────────────────────────
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16.px,
                            color: AppColors.primerColor,
                          ),
                        ),
                      ),
                      Spacer(),
                      CommonButton(title: "End Inspection", onTap: (){Navigator.of(ctx).pop();},color: AppColors.primerColor,)
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
    // … inside your GetBuilder …

  }
  void _quickPassDialog(BuildContext ctx, InspireVHomeScreenController ctl) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (_) =>
          Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.px),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.px, vertical: 20.px),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ── Title ───────────────────────────────────────
                  Text(
                    'Pass Unit Inspection',
                    style: TextStyle(
                        fontSize: 32.px, fontWeight: FontWeight.w600,fontFamily: "Roboto"),
                  ),
                  Text(
                    'You will quick pass the Inspection',
                    style: TextStyle(
                        fontSize: 16.px, fontWeight: FontWeight.w400,fontFamily: "Roboto"),
                  ),
                  SizedBox(height: 20.px),

                  // ── Reactive Carousel ───────────────────────────
                  GetBuilder<InspireVHomeScreenController>(
                    builder: (c) {
                      return Container(
                        height: 100.px,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(12.px),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.px),
                          child: c.imageList.isEmpty
                          // ── State 1: Before any image ─────────────
                              ? GestureDetector(
                            onTap: c.imagePicker,
                            child: Container(
                              height: 76.px,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 60.px,
                                    alignment: Alignment.center,
                                    child: SvgPicture.string(
                                      addCameraIcon,
                                      width: 32.px,
                                      height: 32.px,
                                      color: AppColors.primerColor,
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Colors.grey.shade300,
                                    thickness: 1,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                      EdgeInsets.symmetric(vertical: 8.px),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Picture required',
                                            style: TextStyle(
                                              fontSize: 16.px,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primerColor,
                                            ),
                                          ),
                                          Text(
                                            'before continue',
                                            style:
                                            TextStyle(fontSize: 14.px),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          // ── State 2: After images added ────────────
                              : Row(
                            children: [
                              // ── Scrollable add + thumbs ───────────────────────
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      // 1) Add tile + divider
                                      GestureDetector(
                                        onTap: c.imagePicker,
                                        child: Container(
                                          height: 76.px,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.px),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                                8.px),
                                          ),
                                          child: Row(
                                            children: [
                                              SvgPicture.string(
                                                addCameraIcon,
                                                width: 32.px,
                                                height: 32.px,
                                                color: AppColors.primerColor,
                                              ),
                                              SizedBox(width: 8.px),
                                              Container(
                                                width: 1.px,
                                                height: 48.px,
                                                color: Colors.grey.shade300,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      SizedBox(width: 8.px),

                                      // 2) Thumbnails
                                      for (var i = 0; i <
                                          c.imageList.length; i++) ...[
                                        Stack(
                                          children: [
                                            Container(
                                              width: 76.px,
                                              height: 76.px,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius
                                                    .circular(8.px),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius
                                                    .circular(8.px),
                                                child: c.imageList[i]
                                                    .startsWith('http')
                                                    ? CachedNetworkImage(
                                                  imageUrl: c.imageList[i],
                                                  fit: BoxFit.cover,
                                                )
                                                    : Image.file(
                                                  File(c.imageList[i]),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              top: 4.px,
                                              right: 4.px,
                                              child: GestureDetector(
                                                onTap: () => c.removeImage(i),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  padding: EdgeInsets.all(2.px),
                                                  child: Icon(
                                                      Icons.close, size: 16.px,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 8.px),
                                      ],
                                    ],
                                  ),
                                ),
                              ),

                              // ── Spacer pushes ✔ to the far right ───────────────
                              Spacer(),

                              // 3) Confirm tile
                              GestureDetector(
                                onTap: () => Navigator.of(Get.context!).pop(),
                                child: Center(
                                  child: SvgPicture.string(
                                    successIcon,
                                    width: 32.px,
                                    height: 32.px,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 24.px),

                  // ── Action Buttons ────────────────────────────
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16.px,
                            color: AppColors.primerColor,
                          ),
                        ),
                      ),
                      Spacer(),
                      CommonButton(title: "Complete Inspection", onTap: (){Navigator.of(ctx).pop();},color: AppColors.primerColor,)
                    ],
                  ),
                ],
              ),
            ),
          ),
    );
    // … inside your GetBuilder …

  }

}
