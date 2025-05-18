import 'package:flutter_svg/svg.dart';

import '../../../../commons/all.dart';
import '../../unitScreen/controller/unitScreen_controller.dart';
import '../controller/addInspectionScreenController.dart';

class InspireVAddInspectionScreen extends StatelessWidget {
  const InspireVAddInspectionScreen({Key? key}) : super(key: key);
  static const String routes = '/inspireVAddInspectionScreen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InspireVAddInspectionScreenController>(
      init: InspireVAddInspectionScreenController(),
      assignId: true,
      builder: (controller) {
        return BaseScreen(
          backgroundColor: controller.appColors.appBGColor,
          child: SafeArea(
            child: Column(
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
                          CommonBackButton(
                            color: controller.appColors.transparent,
                            height: 20.px,
                            onClickBack: () {
                              Get.back();
                            },
                          ),
                          Spacer(),
                          Image.asset(
                            ImagePath.logo,
                            width: 182.px,
                            height: 40.63.px,
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ).paddingOnly(bottom: 4),

                // Scrollable Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 32.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: MyTextView(
                                "Add Inspection",
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
                          ],
                        ),

                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            controller.inspectorNameController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            // Regular
                                            fontSize: 16),
                                        decoration: _inputDecoration(
                                          label: 'Inspector Name',
                                          hint: 'Type Inspector Name',
                                          prefixIcon:
                                              Icon(Icons.person_outline),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.px),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.pickDate(context),
                                        child: CommonDateField(
                                          label: "Inspection Date",
                                          value: controller.formatDate(
                                              controller.inspectionDate),
                                          icon: Icons.calendar_today_outlined,
                                          hintText: "",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.px),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () =>
                                            controller.pickTime(context),
                                        child: CommonDateField(
                                          label: "Inspection Hour",
                                          value: controller.formatTime(
                                              controller.inspectionTime),
                                          icon: Icons.access_time,
                                          hintText: "Tenant name",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 16.px),

                                DropdownButtonFormField<String>(
                                  value: controller.selectedInspectionType,
                                  decoration: InputDecoration(
                                    labelText: 'Inspection Type',
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
                                    controller.selectedInspectionType = val!;
                                    controller.update();
                                  },
                                ),
                                SizedBox(height: 24.px),

                                // === Unit Information Section ===
                                MyTextView(
                                  "Unit Information",
                                  textStyleNew: TextStyle(fontFamily: "Roboto",fontSize: 24,fontWeight: FontWeight.bold),

                                ),
                                SizedBox(height: 16.px),

                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            controller.tenantNameController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            // Regular
                                            fontSize: 16),
                                        decoration: _inputDecoration(
                                          label: 'Tenant name',
                                          hint: 'Type tenant name',
                                          prefixIcon: Icon(Icons.home_outlined),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.px),
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            controller.tenantPhoneController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            // Regular
                                            fontSize: 16),
                                        decoration: _inputDecoration(
                                          label: 'Tenant Phone',
                                          hint: 'Type tenant phone',
                                          prefixIcon: Icon(Icons.call_outlined),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.px),
                                TextFormField(
                                  controller: controller.unitAddressController,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400, // Regular
                                      fontSize: 16),
                                  decoration: _inputDecoration(
                                    label: 'Unit Address',
                                    hint: 'Type unit address',
                                    prefixIcon: Icon(Icons.navigation_outlined),
                                  ),
                                ),

                                SizedBox(height: 16.px),

                                Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            controller.landlordNameController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            // Regular
                                            fontSize: 16),
                                        decoration: _inputDecoration(
                                          label: 'Landlord Name',
                                          hint: 'Type landlord name',
                                          prefixIcon: Icon(Icons.home_outlined),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.px),
                                    Expanded(
                                      child: TextFormField(
                                        controller:
                                            controller.landlordPhoneController,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w400,
                                            // Regular
                                            fontSize: 16),
                                        decoration: _inputDecoration(
                                          label: 'Landlord Phone',
                                          hint: 'Type landlord phone',
                                          prefixIcon: Icon(Icons.call_outlined),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 32.px),

                                // === Save Button ===
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          controller.appColors.appColor,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 32.px, vertical: 14.px),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(24)),
                                    ),
                                    onPressed: () {
                                      if (controller.validateForm()) {
                                        controller.addInspectionTap();
                                      }
                                    },
                                    child: MyTextView(
                                      "Save Inspection",
                                      textStyleNew: MyTextStyle(
                                        textColor: controller.appColors.white,
                                        textSize: 16.px,
                                        textWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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
            color: Colors.black,
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

class CommonDateField extends StatelessWidget {
  final String label;
  final String? value;
  final IconData icon;
  final String hintText;
  final TextEditingController? controller;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType keyboardType;

  const CommonDateField({
    super.key,
    required this.label,
    this.value,
    required this.icon,
    required this.hintText,
    this.controller,
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      prefixIcon: Icon(icon, color: Colors.grey[700]),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black, width: 1.0), // Added width
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.black, width: 1.0), // Added width
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide:
            BorderSide(color: Colors.black, width: 2.0), // Consistent width
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 6),
        controller != null
            ? TextFormField(
                controller: controller,
                readOnly: readOnly || onTap != null,
                onTap: onTap,
                keyboardType: keyboardType,
                decoration: inputDecoration,
              )
            : GestureDetector(
                onTap: onTap,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      // Added border here
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(icon, color: Colors.grey[700]),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          value ?? '',
                          style: TextStyle(
                            color: value == null || value!.isEmpty
                                ? Colors.grey[500]
                                : Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
