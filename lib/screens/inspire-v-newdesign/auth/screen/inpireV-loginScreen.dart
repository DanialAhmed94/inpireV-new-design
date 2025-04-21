import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/all.dart';
import '../controller/inpireV_loginController.dart';

class InspireVSigningScreen extends GetView<InspireVSigningController> {
  const InspireVSigningScreen({Key? key}) : super(key: key);

  static const routes = "/InspireVSigningScreen";

  @override
  @override
  @override
  Widget build(BuildContext context) {
    final gap = SizedBox(height: 40);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImagePath.inspreVSigninBackground,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // top logo
                            Image.asset(ImagePath.inspreVSigninLogo),
                            SizedBox(height: 16),

                            // subtitle
                            Text(
                              'Log in to your account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontFamily: "Futura_Hv_BT",
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 40),

                            // Client dropdown
                            Obx(() {
                              final selected = controller.selectedClient.value;
                              final list     = controller.clients;

                              return DropdownButtonFormField<String>(
                                icon: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
                                dropdownColor: Colors.white,


                                selectedItemBuilder: (_) {
                                  return list.map((c) {
                                    return Text(
                                      c,
                                      style: TextStyle(
                                        color: Colors.white,       // ← selected text in white
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    );
                                  }).toList();
                                },
                                // ————————————————————————

                                value: selected,
                                hint: Text(
                                  'Select your client',
                                  style: TextStyle(color: Colors.white54, fontSize: 16),
                                ),
                                items: list.map((c) {
                                  return DropdownMenuItem(
                                    value: c,
                                    child: Text(
                                      c,
                                      style: TextStyle(
                                        color: Colors.black,      // ← menu items in black
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (v) => controller.selectedClient.value = v,
                                decoration: _inputDecoration(label: 'Client', hint: ''),
                              );
                            }),

                            gap,

                            // Username
                            TextFormField(
                              controller: controller.usernameController,
                              style: TextStyle(color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400, // Regular
                                  fontSize: 16),
                              decoration: _inputDecoration(
                                label: 'User',
                                hint: 'Type your user',
                              ),
                            ),
                            gap,

                            // Password
                            TextFormField(
                              controller: controller.passwordController,
                              obscureText: true,
                              style: TextStyle( color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w400, // Regular
                                  fontSize: 16),
                              decoration: _inputDecoration(
                                label: 'Password',
                                hint: 'Type your password',
                              ),
                            ),
                            SizedBox(height: 40),

                            // Log in button
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: OutlinedButton(
                                onPressed: controller.onLoginTap,
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.white.withOpacity(0.2)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Log in',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w600, // Regular
                                      fontSize: 20
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            // Forgot password
                            TextButton(
                              onPressed: controller.onForgotPasswordTap,
                              child: Text(
                                'Forgot password?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500, // Regular
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),

                            // ← Gilson logo now here, under the form
                            SizedBox(height: 24),
                            Image.asset(
                              ImagePath.inspreVSigninGilsonLogo,
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // removed the bottom‑pinned logo padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required String hint,
  }) =>
      InputDecoration(


        labelText: label,
        labelStyle: TextStyle(color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400, // Regular
            fontSize: 16),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400, // Regular
            fontSize: 16),

        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(
          // <-- change this to your desired container color:
          backgroundColor:  Color(0xFF013499),
          color: Colors.white,
          fontSize: 12,
        ),

        enabledBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
      );

}
