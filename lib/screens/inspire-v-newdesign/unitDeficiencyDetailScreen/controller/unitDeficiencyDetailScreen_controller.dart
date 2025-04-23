import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../commons/all.dart';
import '../../../../commons/common_widgets/base_widgets.dart';
import '../../../deficiencies_inside_screen/Repository/deficiencies_inside_repository.dart';
import '../../../deficiencies_inside_screen/controller/deficiencies_inside_controller.dart';
import '../../unitDeficiencyScreen/screen/unitDeficiencyScreen.dart';

// Controller
class InpireVUnitDeficiencyDetailScontroller extends BaseController {
  List<String> imageList = [];
  DateTime? selectedDateTime;
  String selectedItem = "present"; // required for AbsorbPointer to work
  final commentController = TextEditingController();
  final dateController = TextEditingController();
  final RxBool isListening = false.obs;
  bool visibleBtn = false;
  late int deficiencyIndex;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments["deficiencyIndex"] != null) {
      deficiencyIndex = Get.arguments["deficiencyIndex"];
    } else {
      deficiencyIndex = 0;
    }
    update();
  }

  void finishAndGoBackToListing() {
    Get.offNamed(
      InspireVUnitDeficiencyScreen.routes,
      arguments: {"deficiencyIndex": deficiencyIndex},
    );
  }

  void selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = DateFormat("MM/dd/yyyy").format(picked);
      visibleBtn = commentController.text.isNotEmpty && imageList.isNotEmpty;
      update();
    }
  }

  void saveChanges() {
    // TODO: implement save logic
    update();
  }

  void imagePicker() {
    alertActionDialogApp(
      context: Get.context!,
      borderRadius: 28.px,
      widget: Padding(
        padding: EdgeInsets.all(24.px),
        child: Column(
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

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );
    if (pickedFile != null) await _handlePickedFile(pickedFile);
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 25,
    );
    if (pickedFile != null) await _handlePickedFile(pickedFile);
  }

  Future<void> _handlePickedFile(XFile pickedFile) async {
    final tempDir = await getTemporaryDirectory();
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

    final file = File(
      '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png',
    )..createSync();
    file.writeAsBytesSync(editedBytes);

    imageList.add(file.path);
    visibleBtn = commentController.text.isNotEmpty && imageList.isNotEmpty;
    update();
  }

  void removeImage(int index) {
    imageList.removeAt(index);
    visibleBtn = commentController.text.isNotEmpty && imageList.isNotEmpty;
    update();
  }

  Future<void> showDeficiencyCriteriaDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title + close button
              Row(
                children: [
                  Expanded(
                    child: Text('Deficiency Criteria',
                        style: TextStyle(
                            color: AppColors.primerColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            fontFamily: "Roboto")),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Card with icons + text
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Row(
                  children: [
                    // Correction timeframe
                    SvgPicture.string(clockIcon),
                    const SizedBox(width: 8),
                    Text(
                      'Correction Timeframe: ',
                      style: TextStyle(color: AppColors.primerColor),
                    ),
                    Text('30 days',
                        style: TextStyle(
                            color: AppColors.primerColor,
                            fontWeight: FontWeight.bold)),
                    const Spacer(),

                    // H&S determination
                    SvgPicture.string(heartIcon),
                    const SizedBox(width: 8),
                    Text('H&S Determination: ',
                        style: TextStyle(color: AppColors.primerColor)),
                    Text('M',
                        style: TextStyle(
                            color: AppColors.primerColor,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Body text
              Text(
                '50% or more of the kitchen, bath, or laundry cabinet, drawers, or shelves are damaged (i.e., visibly defective; impacts functionality).\n'
                'OR\n'
                '50% or more of the kitchen, bath, or laundry cabinet, drawers, or shelves are inoperable (i.e., overall system or component thereof is not meeting function or purpose; with or without visible damage).\n'
                'OR\n'
                '50% or more of the kitchen, bath, or laundry cabinet, drawers, or shelves are missing (i.e., evidence of prior installation, but now not present or is incomplete).',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:image_editor_plus/image_editor_plus.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';
//
// import '../../../../commons/all.dart';
// import '../../../../commons/common_widgets/base_widgets.dart';
// import '../../../deficiencies_inside_screen/Repository/deficiencies_inside_repository.dart';
// import '../../../deficiencies_inside_screen/controller/deficiencies_inside_controller.dart';
// import '../../unitDeficiencyScreen/screen/unitDeficiencyScreen.dart';
//
// class InpireVUnitDeficiencyDetailScontroller extends BaseController {
//   List<String> imageList = [];
//
//   ImageUploadStatus imageUploadStatus = ImageUploadStatus.initial;
//   DateTime? selectedDateTime;
//   String selectedItem = "present"; // required for AbsorbPointer to work
//   final commentController = TextEditingController();
//   final dateController = TextEditingController();
//   final RxBool isListening = false.obs;
//   bool visibleBtn = false;
//
//   // ADD THIS to hold the deficiency index
//   late int deficiencyIndex;
//
//   @override
//   void onInit() {
//     super.onInit();
//
//     // capture deficiencyIndex from arguments
//     if (Get.arguments != null && Get.arguments["deficiencyIndex"] != null) {
//       deficiencyIndex = Get.arguments["deficiencyIndex"];
//     } else {
//       deficiencyIndex = 0; // default
//     }
//     update();
//   }
//
//   void finishAndGoBackToListing() {
//     // This route is your deficiency listing screen
//     Get.offNamed(
//       InspireVUnitDeficiencyScreen.routes,
//       arguments: {"deficiencyIndex": deficiencyIndex},
//     );
//   }
//
//   // @override
//   // void onInit() {
//   //   super.onInit();
//   //   update();
//   // }
//   void selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: Get.context!,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       final formatted = DateFormat("MM/dd/yyyy").format(picked);
//       dateController.text = formatted;
//
//       if (commentController.text.isNotEmpty && imageList.isNotEmpty) {
//         visibleBtn = true;
//       } else {
//         visibleBtn = false;
//       }
//       update();
//     }
//   }
//
//   saveChanges() {
//     // var deficiencyInspectionsReqModel = [
//     //   DeficiencyInspectionsReqModel(
//     //     comment: commentController.text,
//     //     date: dateController.text,
//     //     deficiencyProofPictures: imageList,
//     //     housingDeficiencyId: successListOfDeficiencies.housingDeficiencyId.toString(),
//     //     isSuccess: true,
//     //   ),
//     // ];
//     update();
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
//     final pickedFile = await ImagePicker()
//         .pickImage(source: ImageSource.gallery, imageQuality: 25);
//     if (pickedFile != null) await _handlePickedFile(pickedFile);
//   }
//
//   Future<void> getFromCamera() async {
//     final pickedFile = await ImagePicker()
//         .pickImage(source: ImageSource.camera, imageQuality: 25);
//     if (pickedFile != null) await _handlePickedFile(pickedFile);
//   }
//
//   Future<void> _handlePickedFile(XFile pickedFile) async {
//     final tempDir = await getTemporaryDirectory();
//     final editedImage = await Navigator.push(
//       Get.context!,
//       MaterialPageRoute(
//         builder: (_) => ImageEditor(
//           image: File(pickedFile.path).readAsBytesSync(),
//           savePath: tempDir.path,
//         ),
//       ),
//     );
//
//     if (editedImage != null) {
//       final File savedFile = await File(
//               '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png')
//           .create();
//       savedFile.writeAsBytesSync(editedImage);
//       selectedDateTime = await pickedFile.lastModified();
//       final File stampedImage =
//           await Utils().addTimestampToImage(savedFile, selectedDateTime!);
//
//       imageUploadStatus = ImageUploadStatus.uploading;
//       update();
//
//       final response = await DeficienciesInsideRepository()
//           .getImageUpload(filePath: stampedImage.path);
//       response.fold((l) {
//         imageUploadStatus = ImageUploadStatus.initial;
//       }, (r) {
//         imageList.add(r.images?.image ?? '');
//         imageUploadStatus = ImageUploadStatus.success;
//
//         // 👇 This is the important part
//         if (commentController.text.isNotEmpty && imageList.isNotEmpty) {
//           visibleBtn = true;
//         } else {
//           visibleBtn = false;
//         }
//
//         update();
//       });
//     }
//   }
//
//   removeImage(int index) {
//     imageList.removeAt(index);
//     imageUploadStatus = imageList.isEmpty
//         ? ImageUploadStatus.initial
//         : ImageUploadStatus.success;
//     update();
//   }
// }
