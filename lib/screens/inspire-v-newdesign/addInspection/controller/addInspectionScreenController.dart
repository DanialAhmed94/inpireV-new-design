import 'dart:io';
import 'dart:typed_data';


import 'package:public_housing/commons/all.dart';

import '../../homeScreen/controller/inpireV_home_controller.dart';


class InspireVAddInspectionScreenController extends BaseController {
  final GlobalKey<PopupMenuButtonState<int>> popupKey = GlobalKey();
  actionPopUpItemSelected(int value) {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar;
    String message;
    if (value == 0) {
      message = 'You selected ${Strings.editProfile}';
    } else if (value == 1) {
      message = 'You selected ${Strings.inspectionHistory}';
    } else if (value == 2) {
      message = 'You selected ${Strings.nSPIREStandards}';
    } else if (value == 3) {
      message = 'You selected ${Strings.changeSection1}';
      //Get.offAllNamed(PropertiesListScreen.routes);
    } else if (value == 4) {
      message = 'You selected ${Strings.logOut}';
      //  Get.offAllNamed(SigningScreen.routes);
      getStorageData.removeData(getStorageData.isLogin);
      getStorageData.removeData(getStorageData.baseURL);
    } else {
      message = 'Not implemented';
    }
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
  // Form Fields
  final inspectorNameController = TextEditingController();
  final tenantNameController = TextEditingController();
  final tenantPhoneController = TextEditingController();
  final unitAddressController = TextEditingController();
  final landlordNameController = TextEditingController();
  final landlordPhoneController = TextEditingController();

  DateTime? inspectionDate;
  TimeOfDay? inspectionTime;

  final List<String> inspectionTypes = [
    'Annual Inspection',
    'Initial',
    'Special',
    'Re-Inspection',
    'Quality Control',
    'Initial Re-Inspection',
    'Abatement Inspection',
    'Tenant Moved Out',
    'Weather Deferred',
    'Void',
    '24hs Re-Inspection',
    'Special Re-Inspection',
    'Abated Unit',
  ];
  String? selectedInspectionType;

  void pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: inspectionDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      inspectionDate = picked;
      update();
    }
  }

  void pickTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: inspectionTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      inspectionTime = picked;
      update();
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    return "${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}";
  }

  String formatTime(TimeOfDay? time) {
    if (time == null) return '';
    final hour = time.hourOfPeriod.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return "$hour:$minute $period";
  }

  Future<void> addInspectionTap() async {
    // Get the HomeController instance
    final homeController = Get.find<InspireVHomeScreenController>();

    // Create new inspection item with form data and hardcoded values
    final newInspection = InspectionItem(
      address: unitAddressController.text,
      location: 'South Bend, IN', // Hardcoded
      tenantName: tenantNameController.text,
      tenantPhone: tenantPhoneController.text,
      landlordName: landlordNameController.text,
      landlordPhone: landlordPhoneController.text,
      date: inspectionDate ?? DateTime.now(),
      timeRange: inspectionTime != null
          ? "${formatTime(inspectionTime)} - ${formatTime(inspectionTime!.replacing(hour: inspectionTime!.hour + 2))}"
          : '08:00 - 10:00', // Hardcoded if time not selected
      tagLabel: selectedInspectionType ?? 'Annual Inspection',
      comments: "4 of 10 cabinets are missing -PM", // Hardcoded
      bedrooms: 2, // Hardcoded
      bathrooms: 1, // Hardcoded
    );

    // Add to home controller's list
    homeController.inspections.insert(0, newInspection); // ← Changed from add() to insert(0, ...)
    homeController.update();

    // Clear form fields
    clearForm();

    // Navigate back
    Get.back();
  }

  void clearForm() {
    inspectorNameController.clear();
    tenantNameController.clear();
    tenantPhoneController.clear();
    unitAddressController.clear();
    landlordNameController.clear();
    landlordPhoneController.clear();
    inspectionDate = null;
    inspectionTime = null;
    selectedInspectionType = null;
    update();
  }
  bool validateForm() {
    if (inspectorNameController.text.isEmpty ||
        unitAddressController.text.isEmpty ||
        inspectionDate == null ||
        inspectionTime == null ||
        selectedInspectionType == null) {
      Get.snackbar(
        'Missing Information',
        'Please fill all required fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}



