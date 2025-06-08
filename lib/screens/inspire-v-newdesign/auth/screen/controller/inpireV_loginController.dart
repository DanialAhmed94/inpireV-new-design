import 'dart:convert';

import 'package:get/get.dart';
import 'package:public_housing/screens/inspire-v-newdesign/auth/model/inspector_model_inspireV.dart';

import '../../../../../api_authentication/get_token_account.dart';
import '../../../../../api_authentication/login_account_direct_request.dart';
import '../../../../../commons/all.dart';
import '../../../../../languages/language.dart';
import '../../../welcomescreen/screen/inpirev_welcomeScreen.dart';
import '../../model/client_model_inspireV.dart';
import '../../repository/login_repository_inspireV.dart';


class InspireVSigningController extends BaseController {
  /// Dummy clients for the dropdown (replace with real data later if needed)
  final clients = <String>['Dev', 'Newport', 'Chattanooga','Marin','DCHA','HACLA'].obs;
  final RxList<InspireTenant> clientList = <InspireTenant>[].obs;

  /// Currently selected client
 // final Rxn<String> selectedClient = Rxn<String>();
  final Rxn<InspireTenant> selectedClient = Rxn<InspireTenant>();

  /// Text controllers for the user & password fields
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  LoginRepositoryInspireV loginRepository = LoginRepositoryInspireV();
  TokenAccount? tokenAccount;
  var islogin = false.obs;
  bool checked = false;
  bool isEmail = false;
  //List clientList = [];
  bool isPass = false;
  var hide = true;

  @override
  void onInit() {
    super.onInit();
    // initialize dropdown
    fetchTenants();
  }
  Future<void> fetchTenants() async {
    final result = await loginRepository.fetchTenants();
    result.fold(
          (failure) {
        utils.showSnackBar(
          context: Get.context!,
          message: failure.errorMessage,
        );

      },
          (tenants) {
        clientList.assignAll(tenants);
      },
    );
  }

  void onClientSelected(InspireTenant tenant) {
    selectedClient.value = tenant;
    getStorageData.saveString(getStorageData.baseURL, tenant.domainUrl);
    getStorageData.saveString(getStorageData.clientName, tenant.name);
  }

  loginApiCallCareCart() async {
    String user = usernameController.text;
    String password = passwordController.text;
    try {
      TokenAccount tokenAccount = await loginAccount(user, password);
      print("account token" + tokenAccount.toString());
      saveAccountCareCart(tokenAccount);
      getStorageData.saveString(getStorageData.isLogin, true);
      // Get.offAllNamed(BuildingInspectionScreen.routes);
      Get.offAllNamed(InspireVSelectionScreen.routes);
      // Get.offAllNamed(PropertiesListScreen.routes);

      return tokenAccount;
    } catch (e) {
      print(e.toString());
      String title = "Error";
      String errorMessage = "An error has occurred";
      if (e.toString().contains("LA1000")) {
        title = "Account not found";
        errorMessage = "Email or password incorrect";
      }
      if (e.toString().contains("LA1001")) {
        title = "Account not found";
        errorMessage = "User name or password incorrect";
      }
      if (e.toString().contains("LA1002")) {
        // print(e);
        errorMessage =
        "We're sorry, but it seems that this account has been deleted. If you believe this is an error or need further assistance, please contact our support team";
        title = "Account deleted";
      }
      Get.snackbar("", "",
          titleText: Text(title,
              style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 19,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
          messageText: Text(errorMessage,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 17,
              )),
          duration: Duration(seconds: 10),
          boxShadows: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3))
          ],
          snackStyle: SnackStyle.FLOATING);
      return null;
    }
  }

  saveAccountCareCart(TokenAccount tokenAc) async {
    getStorageData.saveString(getStorageData.token, tokenAc.token);
    getStorageData.saveString(
        getStorageData.account, jsonEncode(tokenAc.account.toJson()));
    await createInspector(name: tokenAc.account.userName);
  }

  validation() {
    print("**** inside validation");
    if (utils.isValidationEmpty(usernameController.text.trim())) {
      print("**** inside first if");

      utils.showSnackBar(
          context: Get.context!,
          message: Languages.of(Get.context!)!.pleaseEnterEmail);
    } else if (utils.isValidationEmpty(passwordController.text.trim())) {
      print("**** inside second if");

      utils.showSnackBar(
          context: Get.context!,
          message: Languages.of(Get.context!)!.pleaseEnterPassword);
    } else {
      print("**** inside else");

      loginApiCallCareCart();
    }
  }

  createInspector({required String name}) async {
    var response = await loginRepository.createInspector(name: name);
    response.fold((l) {
      utils.showSnackBar(context: Get.context!, message: l.errorMessage);
    }, (InspectorModelInspireV r) {
      print("rname" + r.inspector.id.toString());
      getStorageData.saveString(getStorageData.inspectorId, r.inspector.id);
    });
    update();
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
    usernameFocusNode.dispose();
    passwordFocusNode.dispose();
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