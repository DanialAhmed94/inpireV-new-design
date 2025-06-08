import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:public_housing/commons/all.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../deficiencies_inside_screen/Repository/deficiencies_inside_repository.dart';
import '../../../deficiencies_inside_screen/controller/deficiencies_inside_controller.dart';
import '../../../quic_fails_inspection_screen/screen/area_listing_screen.dart';
import '../../addInspection/screen/addInspectionScreen.dart';
import '../../standard_screen/screen/inpireV_standardScreen.dart';

enum PropertyStatus { completed, scheduled }

class InspireVHomeScreenController extends BaseController {
  final GlobalKey<PopupMenuButtonState<int>> popupKey = GlobalKey();
  PickerDateRange? dateRange;
  String startDate = '';
  String endDate = '';
  bool isDateSelected = false;
  PropertyStatus status = PropertyStatus.scheduled;
  DateTime? startDateTime = DateTime.now();
  DateTime? endDateTime = DateTime.now();

  /// The list we’ll drive the UI from
  final inspections = <InspectionItem>[];
  List<String> imageList = [];
  ImageUploadStatus imageUploadStatus = ImageUploadStatus.initial;
  DateTime? selectedDateTime;
  final completedInspections = <CompletedInspectionItem>[];

  final Rxn<InspectionInProgress> currentInspection =
      Rxn<InspectionInProgress>();

  @override
  void onInit() {
    super.onInit();
    // TODO: replace with real data fetch
    inspections.addAll([
      InspectionItem(
          address: '2113 Kendall Street',
          location: 'South Bend, IN',
          tenantName: 'Fernando Devries',
          tenantPhone: '555‑5555‑5555',
          landlordName: 'Fernando Devries',
          landlordPhone: '555‑5555‑5555',
          date: DateTime(2023, 6, 22),
          timeRange: '08:00 - 10:00',
          tagLabel: 'Annual Inspection',
          comments: "4 of 10 cabinets are missing -PM"),
      InspectionItem(
          address: '2113 Kendall Street',
          location: 'South Bend, IN',
          tenantName: 'Fernando Devries',
          tenantPhone: '555‑5555‑5555',
          landlordName: 'Fernando Devries',
          landlordPhone: '555‑5555‑5555',
          date: DateTime(2023, 6, 22),
          timeRange: '08:00 - 10:00',
          tagLabel: 'Annual Inspection',
          comments: "4 of 10 cabinets are missing -PM"),
      InspectionItem(
          address: '2113 Kendall Street',
          location: 'South Bend, IN',
          tenantName: 'Fernando Devries',
          tenantPhone: '555‑5555‑5555',
          landlordName: 'Fernando Devries',
          landlordPhone: '555‑5555‑5555',
          date: DateTime(2023, 6, 22),
          timeRange: '08:00 - 10:00',
          tagLabel: 'Annual Inspection',
          comments: "4 of 10 cabinets are missing -PM"),
      InspectionItem(
          address: '2113 Kendall Street',
          location: 'South Bend, IN',
          tenantName: 'Fernando Devries',
          tenantPhone: '555‑5555‑5555',
          landlordName: 'Fernando Devries',
          landlordPhone: '555‑5555‑5555',
          date: DateTime(2023, 6, 22),
          timeRange: '08:00 - 10:00',
          tagLabel: 'Annual Inspection',
          comments: "4 of 10 cabinets are missing -PM"),
      // … add more …
    ]);
    completedInspections.addAll([
      CompletedInspectionItem(
        address: '2113 Kendall Street',
        location: 'South Bend, IN',
        date: DateTime(2023, 6, 22),
        timeRange: '08:00 - 10:00',
        tagLabel: "",
        tenantName: "",
      ),
      CompletedInspectionItem(
        address: '2113 Kendall Street',
        location: 'South Bend, IN',
        date: DateTime(2023, 6, 22),
        timeRange: '08:00 - 10:00',
        tagLabel: "",
        tenantName: "",
      ),
      // ... more completed items ...
    ]);
  }

// Signature Controllers
  ScreenshotController tenantSignController = ScreenshotController();
  ScreenshotController ownerSignController = ScreenshotController();
  GlobalKey<SfSignaturePadState> tenantSignPadKey = GlobalKey();
  GlobalKey<SfSignaturePadState> ownerSignPadKey = GlobalKey();
  bool isTenantBlank = true;
  bool isOwnerBlank = true;
  bool tenantSign = false;
  String tenantSignature = '';

// Add these in your controller class
  void resetSignatureState() {
    isTenantBlank = true;
    isOwnerBlank = true;
    tenantSign = false;
    tenantSignPadKey.currentState?.clear();
    ownerSignPadKey.currentState?.clear();
    clearTenantSignature();
    clearOwnerSignature();
    update();
  }

  void startTenantSignature() {
    isTenantBlank = false;
    update();
  }

  void clearTenantSignature() {
    tenantSignPadKey.currentState?.clear();
    isTenantBlank = true;
    update();
  }

  void clearOwnerSignature() {
    ownerSignPadKey.currentState?.clear();
    isOwnerBlank = true;
    update();
  }

  void startOwnerSignature() {
    isOwnerBlank = false;
    update();
  }

  /// Called by the UI when the tile expands/collapses
  void toggleExpansion(int index, bool expanded) {
    inspections[index].isExpanded = expanded;
    update();
  }

  void incrementBedrooms(int idx) {
    inspections[idx].bedrooms++;
    update();
  }

  void decrementBedrooms(int idx) {
    if (inspections[idx].bedrooms > 0) {
      inspections[idx].bedrooms--;
      update();
    }
  }

  void incrementBathrooms(int idx) {
    inspections[idx].bathrooms++;
    update();
  }

  void decrementBathrooms(int idx) {
    if (inspections[idx].bathrooms > 0) {
      inspections[idx].bathrooms--;
      update();
    }
  }

  void onStartInpectionTap(
    String address,
    String location,
    DateTime date,
      String timerange,
      String tagLabel,
      String tenantName
  ) {
    // Save the current inspection info
    currentInspection.value = InspectionInProgress(
      address: address,
      location: location,
      date: date,
      timeRange: timerange,
      tagLabel: tagLabel,
      tenantName: tenantName,
    );

    Get.toNamed(InspireVStandardScreen.routes);
  }

  // void onStartInpectionTap() {
  //   // for now just log to console
  //   debugPrint('Start Inpection tapped → ');
  //   Get.toNamed(InspireVStandardScreen.routes);
  // }
  void onAddInspectionTap() {
    // for now just log to console
    debugPrint('Add Inpection tapped → ');
    Get.toNamed(InspireVAddInspectionScreen.routes);
  }

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

  String todayDateGet(DateTime date) {
    final DateFormat format2 = DateFormat('MMMM dd');
    return format2.format(date);
  }

  String getDateFormat({required DateTime date}) {
    final DateFormat format2 = DateFormat('yyyy-MM-dd');
    return format2.format(date);
  }

  bool confirmSelectedDates() {
    if (startDate != '' && endDate != '') {
      isDateSelected = true;
    } else {
      isDateSelected = false;
    }
    return isDateSelected;
  }

  void imagePicker() {
    alertActionDialogApp(
      context: Get.context!,
      borderRadius: 28.px,
      widget: Padding(
        padding: EdgeInsets.all(24.px),
        child: Column(
          // This ensures the column only wraps its children
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.px),
            MyTextView(
              "Upload",
              textStyleNew: MyTextStyle(textSize: 20.px),
            ),
            SizedBox(height: 24.px),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _pickerOption("Gallery", icUpload, getFromGallery),
                _pickerOption("Camera", icCamera, getFromCamera),
              ],
            ),
            SizedBox(height: 24.px),
          ],
        ),
      ),
    );
  }

  Widget _pickerOption(String label, String icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        Get.back();
        onTap();
      },
      child: Column(
        children: [
          SvgPicture.string(icon, height: 30),
          SizedBox(height: 8.px),
          Text(label),
        ],
      ),
    );
  }

  Future<void> openGoogleMap(
      String latitude, String longitude, BuildContext context) async {
    String googleMapsUrl =
        'https://www.google.com/maps/dir/?api=1&destination=${latitude},${longitude}'; // Replace with actual coordinates
    final Uri uri = Uri.parse(googleMapsUrl);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Google Maps not installed. Please install Google Maps to use navigation',
              style: TextStyle(color: Colors.white),
            ),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.black87, // Light black
            action: SnackBarAction(
              label: 'OK',
              textColor: Colors.orange,
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error opening navigation: ${e.toString()}',
            style: TextStyle(color: Colors.white),
          ),

          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.black87, // Light black
          action: SnackBarAction(
            label: 'OK',
            textColor: Colors.orange,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error opening navigation: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (pickedFile != null) await _handlePickedFile(pickedFile);
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 25);
    if (pickedFile != null) await _handlePickedFile(pickedFile);
  }

  Future<void> _handlePickedFile(XFile pickedFile) async {
    final tempDir = await getTemporaryDirectory();
    await Future.delayed(Duration.zero);

    final Uint8List? editedBytes = await Navigator.of(
      Get.context!,
      rootNavigator: true,
    ).push<Uint8List?>(
      MaterialPageRoute(
        builder: (_) => ImageEditor(
          image: File(pickedFile.path).readAsBytesSync(),
          savePath: tempDir.path,
        ),
      ),
    );
    if (editedBytes == null) return;

    // 1) write to local & show immediately
    final localFile =
        File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png')
          ..createSync()
          ..writeAsBytesSync(editedBytes);

    imageList.add(localFile.path);
    imageUploadStatus = ImageUploadStatus.success;
    update(); // ← dialog rebuilds here, showing your thumbnail

    // 2) now do the server call
    imageUploadStatus = ImageUploadStatus.uploading;
    update();
    final resp = await DeficienciesInsideRepository()
        .getImageUpload(filePath: localFile.path);
    resp.fold((l) => imageUploadStatus = ImageUploadStatus.initial, (r) {
      final url = r.images?.image ?? localFile.path;
      final idx = imageList.indexOf(localFile.path);
      if (idx != -1) imageList[idx] = url;
      imageUploadStatus = ImageUploadStatus.success;
    });
    update();
  }

  // Future<void> _handlePickedFile(XFile pickedFile) async {
  //   final tempDir = await getTemporaryDirectory();
  //   final editedImage = await Navigator.push(
  //     Get.context!,
  //     MaterialPageRoute(
  //       builder: (_) => ImageEditor(
  //         image: File(pickedFile.path).readAsBytesSync(),
  //         savePath: tempDir.path,
  //       ),
  //     ),
  //   );
  //
  //   if (editedImage != null) {
  //     final File savedFile = await File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png').create();
  //     savedFile.writeAsBytesSync(editedImage);
  //     selectedDateTime = await pickedFile.lastModified();
  //     final File stampedImage = await Utils().addTimestampToImage(savedFile, selectedDateTime!);
  //
  //     imageUploadStatus = ImageUploadStatus.uploading;
  //     update();
  //
  //     final response = await DeficienciesInsideRepository().getImageUpload(filePath: stampedImage.path);
  //     response.fold((l) {
  //       imageUploadStatus = ImageUploadStatus.initial;
  //     }, (r) {
  //       imageList.add(r.images?.image ?? '');
  //       imageUploadStatus = ImageUploadStatus.success;
  //
  //
  //
  //       update();
  //     });
  //
  //   }
  // }

  removeImage(int index) {
    imageList.removeAt(index);
    imageUploadStatus = imageList.isEmpty
        ? ImageUploadStatus.initial
        : ImageUploadStatus.success;
    update();
  }

  @override
  void onClose() {
    // Clean up any resources if needed
    super.onClose();
  }
}

// inspire-v-home-controller.dart
class InspectionItem {
  String address;
  String location;
  String tenantName;
  String tenantPhone;
  String landlordName;
  String landlordPhone;
  DateTime date;
  String timeRange;
  String tagLabel;
  String comments;
  bool isExpanded;
  int bedrooms;
  int bathrooms;

  InspectionItem({
    required this.address,
    required this.location,
    required this.tenantName,
    required this.tenantPhone,
    required this.landlordName,
    required this.landlordPhone,
    required this.date,
    required this.timeRange,
    required this.tagLabel,
    this.comments = '',
    this.isExpanded = false,
    this.bedrooms = 2,
    this.bathrooms = 1,
  });
}

class CompletedInspectionItem {
  String address;
  String location;
  DateTime date;
  String timeRange;
  String tagLabel;
  String tenantName;

  CompletedInspectionItem({
    required this.address,
    required this.location,
    required this.date,
    required this.timeRange,
    required this.tagLabel,
    required this.tenantName,
  });
}

class InspectionInProgress {
  String address;
  String location;
  DateTime date;
  String timeRange;
  String tagLabel;
  String tenantName;

  // Add more fields as needed (e.g., address, photos, results, etc.)

  InspectionInProgress({
    required this.address,
    required this.location,
    required this.date,
    required this.timeRange,
    required this.tagLabel,
    required this.tenantName,
  });
}

// import 'dart:io';
// import 'dart:typed_data';
//
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:image_editor_plus/image_editor_plus.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:public_housing/commons/all.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// import '../../../deficiencies_inside_screen/Repository/deficiencies_inside_repository.dart';
// import '../../../deficiencies_inside_screen/controller/deficiencies_inside_controller.dart';
// import '../../../quic_fails_inspection_screen/screen/area_listing_screen.dart';
//
// enum PropertyStatus { completed, scheduled }
//
// class InspireVHomeScreenController extends BaseController {
//   final GlobalKey<PopupMenuButtonState<int>> popupKey = GlobalKey();
//   PickerDateRange? dateRange;
//   String startDate = '';
//   String endDate = '';
//   bool isDateSelected = false;
//   PropertyStatus status = PropertyStatus.scheduled;
//   DateTime? startDateTime = DateTime.now();
//   DateTime? endDateTime = DateTime.now();
//   /// The list we’ll drive the UI from
//   final inspections = <InspectionItem>[];
//   List<String> imageList = [];
//   ImageUploadStatus imageUploadStatus = ImageUploadStatus.initial;
//   DateTime? selectedDateTime;
//
//   @override
//   void onInit() {
//     super.onInit();
//     // TODO: replace with real data fetch
//     inspections.addAll([
//       InspectionItem(
//         address: '2113 Kendall Street',
//         location: 'South Bend, IN',
//         tenantName: 'Fernando Devries',
//         tenantPhone: '555‑5555‑5555',
//         landlordName: 'Fernando Devries',
//         landlordPhone: '555‑5555‑5555',
//         date: DateTime(2023, 6, 22),
//         timeRange: '08:00 - 10:00',
//         tagLabel: 'Annual Inspection',
//       ),
//       InspectionItem(
//         address: '2113 Kendall Street',
//         location: 'South Bend, IN',
//         tenantName: 'Fernando Devries',
//         tenantPhone: '555‑5555‑5555',
//         landlordName: 'Fernando Devries',
//         landlordPhone: '555‑5555‑5555',
//         date: DateTime(2023, 6, 22),
//         timeRange: '08:00 - 10:00',
//         tagLabel: 'Annual Inspection',
//       ),
//       InspectionItem(
//         address: '2113 Kendall Street',
//         location: 'South Bend, IN',
//         tenantName: 'Fernando Devries',
//         tenantPhone: '555‑5555‑5555',
//         landlordName: 'Fernando Devries',
//         landlordPhone: '555‑5555‑5555',
//         date: DateTime(2023, 6, 22),
//         timeRange: '08:00 - 10:00',
//         tagLabel: 'Annual Inspection',
//       ),
//       InspectionItem(
//         address: '2113 Kendall Street',
//         location: 'South Bend, IN',
//         tenantName: 'Fernando Devries',
//         tenantPhone: '555‑5555‑5555',
//         landlordName: 'Fernando Devries',
//         landlordPhone: '555‑5555‑5555',
//         date: DateTime(2023, 6, 22),
//         timeRange: '08:00 - 10:00',
//         tagLabel: 'Annual Inspection',
//       ),
//       // … add more …
//     ]);
//   }
//   /// Called by the UI when the tile expands/collapses
//   void toggleExpansion(int index, bool expanded) {
//     inspections[index].isExpanded = expanded;
//     update();
//   }
//
//   void incrementBedrooms(int idx) {
//     inspections[idx].bedrooms++;
//     update();
//   }
//
//   void decrementBedrooms(int idx) {
//     if (inspections[idx].bedrooms > 0) {
//       inspections[idx].bedrooms--;
//       update();
//     }
//   }
//
//   void incrementBathrooms(int idx) {
//     inspections[idx].bathrooms++;
//     update();
//   }
//
//   void decrementBathrooms(int idx) {
//     if (inspections[idx].bathrooms > 0) {
//       inspections[idx].bathrooms--;
//       update();
//     }
//   }
//   actionPopUpItemSelected(int value) {
//     ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar;
//     String message;
//     if (value == 0) {
//       message = 'You selected ${Strings.editProfile}';
//     } else if (value == 1) {
//       message = 'You selected ${Strings.inspectionHistory}';
//     } else if (value == 2) {
//       message = 'You selected ${Strings.nSPIREStandards}';
//     } else if (value == 3) {
//       message = 'You selected ${Strings.changeSection1}';
//       //Get.offAllNamed(PropertiesListScreen.routes);
//     } else if (value == 4) {
//       message = 'You selected ${Strings.logOut}';
//       //  Get.offAllNamed(SigningScreen.routes);
//       getStorageData.removeData(getStorageData.isLogin);
//       getStorageData.removeData(getStorageData.baseURL);
//     } else {
//       message = 'Not implemented';
//     }
//     final snackBar = SnackBar(content: Text(message));
//     ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
//   }
//
//   String todayDateGet(DateTime date) {
//     final DateFormat format2 = DateFormat('MMMM dd');
//     return format2.format(date);
//   }
//
//   String getDateFormat({required DateTime date}) {
//     final DateFormat format2 = DateFormat('yyyy-MM-dd');
//     return format2.format(date);
//   }
//   bool confirmSelectedDates() {
//     if (startDate != '' && endDate != '') {
//       isDateSelected = true;
//     } else {
//       isDateSelected = false;
//     }
//     return isDateSelected;
//   }
//
//   void imagePicker() {
//     alertActionDialogApp(
//       context: Get.context!,
//       borderRadius: 28.px,
//       widget: Padding(
//         padding: EdgeInsets.all(24.px),
//         child: Column(
//           // This ensures the column only wraps its children
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(height: 16.px),
//             MyTextView(
//               "Upload",
//               textStyleNew: MyTextStyle(textSize: 20.px),
//             ),
//             SizedBox(height: 24.px),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _pickerOption("Gallery", icUpload, getFromGallery),
//                 _pickerOption("Camera", icCamera, getFromCamera),
//               ],
//             ),
//             SizedBox(height: 24.px),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _pickerOption(String label, String icon, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: () {
//         Get.back();
//         onTap();
//       },
//       child: Column(
//         children: [
//           SvgPicture.string(icon, height: 30),
//           SizedBox(height: 8.px),
//           Text(label),
//         ],
//       ),
//     );
//   }
//
//   Future<void> getFromGallery() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
//     if (pickedFile != null) await _handlePickedFile(pickedFile);
//   }
//
//   Future<void> getFromCamera() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25);
//     if (pickedFile != null) await _handlePickedFile(pickedFile);
//   }
//
//
//   Future<void> _handlePickedFile(XFile pickedFile) async {
//     final tempDir = await getTemporaryDirectory();
//     await Future.delayed(Duration.zero);
//
//     final Uint8List? editedBytes = await Navigator.of(
//       Get.context!,
//       rootNavigator: true,
//     ).push<Uint8List?>(
//       MaterialPageRoute(
//         builder: (_) => ImageEditor(
//           image: File(pickedFile.path).readAsBytesSync(),
//           savePath: tempDir.path,
//         ),
//       ),
//     );
//     if (editedBytes == null) return;
//
//     // 1) write to local & show immediately
//     final localFile = File(
//         '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png'
//     )..createSync()..writeAsBytesSync(editedBytes);
//
//     imageList.add(localFile.path);
//     imageUploadStatus = ImageUploadStatus.success;
//     update();  // ← dialog rebuilds here, showing your thumbnail
//
//     // 2) now do the server call
//     imageUploadStatus = ImageUploadStatus.uploading;
//     update();
//     final resp = await DeficienciesInsideRepository().getImageUpload(
//         filePath: localFile.path
//     );
//     resp.fold(
//             (l) => imageUploadStatus = ImageUploadStatus.initial,
//             (r) {
//           final url = r.images?.image ?? localFile.path;
//           final idx = imageList.indexOf(localFile.path);
//           if (idx != -1) imageList[idx] = url;
//           imageUploadStatus = ImageUploadStatus.success;
//         }
//     );
//     update();
//   }
//
//   // Future<void> _handlePickedFile(XFile pickedFile) async {
//   //   final tempDir = await getTemporaryDirectory();
//   //   final editedImage = await Navigator.push(
//   //     Get.context!,
//   //     MaterialPageRoute(
//   //       builder: (_) => ImageEditor(
//   //         image: File(pickedFile.path).readAsBytesSync(),
//   //         savePath: tempDir.path,
//   //       ),
//   //     ),
//   //   );
//   //
//   //   if (editedImage != null) {
//   //     final File savedFile = await File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png').create();
//   //     savedFile.writeAsBytesSync(editedImage);
//   //     selectedDateTime = await pickedFile.lastModified();
//   //     final File stampedImage = await Utils().addTimestampToImage(savedFile, selectedDateTime!);
//   //
//   //     imageUploadStatus = ImageUploadStatus.uploading;
//   //     update();
//   //
//   //     final response = await DeficienciesInsideRepository().getImageUpload(filePath: stampedImage.path);
//   //     response.fold((l) {
//   //       imageUploadStatus = ImageUploadStatus.initial;
//   //     }, (r) {
//   //       imageList.add(r.images?.image ?? '');
//   //       imageUploadStatus = ImageUploadStatus.success;
//   //
//   //
//   //
//   //       update();
//   //     });
//   //
//   //   }
//   // }
//
//   removeImage(int index) {
//     imageList.removeAt(index);
//     imageUploadStatus = imageList.isEmpty ? ImageUploadStatus.initial : ImageUploadStatus.success;
//     update();
//   }
//
//   @override
//   void onClose() {
//     // Clean up any resources if needed
//     super.onClose();
//   }
// }
//
// // inspire-v-home-controller.dart
// class InspectionItem {
//   String address;
//   String location;
//   String tenantName;
//   String tenantPhone;
//   String landlordName;
//   String landlordPhone;
//   DateTime date;
//   String timeRange;
//   String tagLabel;
//   String comments;
//   bool isExpanded;
//   int bedrooms;
//   int bathrooms;
//   InspectionItem({
//     required this.address,
//     required this.location,
//     required this.tenantName,
//     required this.tenantPhone,
//     required this.landlordName,
//     required this.landlordPhone,
//     required this.date,
//     required this.timeRange,
//     required this.tagLabel,
//     this.comments = '',
//     this.isExpanded = false,
//     this.bedrooms = 2,
//     this.bathrooms = 1,
//   });
// }
