import 'dart:io';

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import '../../../commons/all.dart';
import '../../../commons/common_widgets/base_widgets.dart';
import '../../../commons/utils.dart';
import '../../deficiencies_inside_screen/Repository/deficiencies_inside_repository.dart';
import '../../deficiencies_inside_screen/controller/deficiencies_inside_controller.dart';
import '../../deficiencies_inside_screen/models/deficiency_inspections_req_model.dart';
import '../../quic_fail_defeciency_listing/screen/quic_fails_defecieny_listing_screen.dart';

class QuickFailsDeficiencyDetailController extends BaseController {
  List<String> imageList = [];
  ImageUploadStatus imageUploadStatus = ImageUploadStatus.initial;
  DateTime? selectedDateTime;
  String selectedItem = "present"; // required for AbsorbPointer to work
  final commentController = TextEditingController();
  final dateController = TextEditingController();
  final RxBool isListening = false.obs;
  bool visibleBtn = false;
  // ADD THIS to hold the deficiency index
  late int deficiencyIndex;

  @override
  void onInit() {
    super.onInit();

    // capture deficiencyIndex from arguments
    if (Get.arguments != null && Get.arguments["deficiencyIndex"] != null) {
      deficiencyIndex = Get.arguments["deficiencyIndex"];
    } else {
      deficiencyIndex = 0; // default
    }
    update();
  }
  void finishAndGoBackToListing() {
    // This route is your deficiency listing screen
    Get.offNamed(
      QuickFailDeficiencyListingScreen.routes,
      arguments: {"deficiencyIndex": deficiencyIndex},
    );
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   update();
  // }
  void selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      final formatted = DateFormat("MM/dd/yyyy").format(picked);
      dateController.text = formatted;

      if (commentController.text.isNotEmpty && imageList.isNotEmpty) {
        visibleBtn = true;
      } else {
        visibleBtn = false;
      }
      update();
    }
  }
   saveChanges() {
    // var deficiencyInspectionsReqModel = [
    //   DeficiencyInspectionsReqModel(
    //     comment: commentController.text,
    //     date: dateController.text,
    //     deficiencyProofPictures: imageList,
    //     housingDeficiencyId: successListOfDeficiencies.housingDeficiencyId.toString(),
    //     isSuccess: true,
    //   ),
    // ];
    update();
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

  Future<void> getFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 25);
    if (pickedFile != null) await _handlePickedFile(pickedFile);
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 25);
    if (pickedFile != null) await _handlePickedFile(pickedFile);
  }

  Future<void> _handlePickedFile(XFile pickedFile) async {
    final tempDir = await getTemporaryDirectory();
    final editedImage = await Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (_) => ImageEditor(
          image: File(pickedFile.path).readAsBytesSync(),
          savePath: tempDir.path,
        ),
      ),
    );

    if (editedImage != null) {
      final File savedFile = await File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png').create();
      savedFile.writeAsBytesSync(editedImage);
      selectedDateTime = await pickedFile.lastModified();
      final File stampedImage = await Utils().addTimestampToImage(savedFile, selectedDateTime!);

      imageUploadStatus = ImageUploadStatus.uploading;
      update();

      final response = await DeficienciesInsideRepository().getImageUpload(filePath: stampedImage.path);
      response.fold((l) {
        imageUploadStatus = ImageUploadStatus.initial;
      }, (r) {
        imageList.add(r.images?.image ?? '');
        imageUploadStatus = ImageUploadStatus.success;

        // 👇 This is the important part
        if (commentController.text.isNotEmpty && imageList.isNotEmpty) {
          visibleBtn = true;
        } else {
          visibleBtn = false;
        }

        update();
      });

    }
  }

   removeImage(int index) {
    imageList.removeAt(index);
    imageUploadStatus = imageList.isEmpty ? ImageUploadStatus.initial : ImageUploadStatus.success;
    update();
  }
}
