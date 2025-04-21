import 'package:get/get.dart';

import '../../../../commons/all.dart';
import '../../welcomescreen/screen/inpirev_welcomeScreen.dart';

class InspireVSigningController extends GetxController {
  /// Dummy clients for the dropdown (replace with real data later if needed)
  final clients = <String>['Client A', 'Client B', 'Client C'].obs;

  /// Currently selected client
  final Rxn<String> selectedClient = Rxn<String>();
  /// Text controllers for the user & password fields
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // initialize dropdown
    if (clients.isNotEmpty) {
      selectedClient.value = clients.first;
    }
  }

  /// Stub: called when “Log in” is tapped
  void onLoginTap() {
    // for now just log to console
    debugPrint(
      'Login tapped → '
          'client=${selectedClient.value}, '
          'user=${usernameController.text}, '
          'pass=${passwordController.text}',
    );
    Get.toNamed(InspireVSelectionScreen.routes);

  }

  /// Stub: called when “Forgot password?” is tapped
  void onForgotPasswordTap() {
    debugPrint('Forgot password tapped');
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}


// import '../../../../commons/all.dart';
// import '../../../../commons/common_widgets/base_widgets.dart';
//
// class InspireVSigningController extends BaseController {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();
//   TextEditingController clientController = TextEditingController();
//
//
//   @override
//   void onInit() {
//     // https://dcha.live.gccs.gilsonsoftware.com/auth/login/
//
//
//     update();
//     super.onInit();
//   }
//
//
// }