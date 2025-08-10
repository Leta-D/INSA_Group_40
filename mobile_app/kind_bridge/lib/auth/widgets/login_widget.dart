import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/auth/auth_controller.dart';
import 'package:kind_bridge/common/pages/main_page.dart';
import 'package:kind_bridge/constants/colors.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});

  final authController = Get.put(AuthController());

  final emailController = TextEditingController();
  final passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Welcome Back !",
          style: GoogleFonts.damion(
            color: appDarkGreen(1),
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Obx(
            () => TextField(
              cursorColor: appDarkGreen(1),
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
                hintText: "Example@gmail.com",
                hintStyle: TextStyle(color: appBlack(0.6)),
                prefixIcon: Icon(
                  CupertinoIcons.mail_solid,
                  color: appDarkGreen(1),
                ),
                errorText:
                    authController.isValidCridentials.value
                        ? null
                        : "* Insert a valid Email",
                errorStyle: TextStyle(color: appRed(1), fontSize: 16),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appRed(1)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appRed(1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appDarkGreen(1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appDarkGreen(1)),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Obx(
            () => TextField(
              cursorColor: appDarkGreen(1),
              obscureText: !authController.isPasswdVisible.value,
              controller: passwdController,
              decoration: InputDecoration(
                labelText: "password",
                labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
                hintText: "At least 6 character!",
                hintStyle: TextStyle(color: appBlack(0.7)),
                prefixIcon: Icon(
                  CupertinoIcons.lock_fill,
                  color: appDarkGreen(1),
                ),
                suffix: InkWell(
                  onTap: () {
                    authController.isPasswdVisible.value =
                        !authController.isPasswdVisible.value;
                  },
                  child: Icon(
                    authController.isPasswdVisible.value
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                    color: appDarkGreen(1),
                  ),
                ),
                errorText:
                    authController.isValidCridentials.value
                        ? null
                        : "* Double a valid Password",
                errorStyle: TextStyle(color: appRed(1), fontSize: 16),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appRed(1)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appRed(1)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appDarkGreen(1)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appDarkGreen(1)),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forget Password?",
              style: TextStyle(color: appRed(1), fontSize: 16),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    print("Leta ==============================");
                    authController.checkLoginValidity(
                      emailController.text,
                      passwdController.text,
                    );
                    if (authController.isValidCridentials.value) {
                      print(emailController.text);
                      print(passwdController.text);
                      Get.to(() => MainPage());
                    } else {
                      Get.snackbar(
                        "Invalid Credentials",
                        "Oops! We couldn't log you in. Please double-check your credentials and try again.",
                        snackStyle: SnackStyle.FLOATING,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: appRed(0.4),
                        colorText: appWhite(1),
                        duration: Duration(seconds: 2),
                      );
                    }
                  },
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(8),
                    backgroundColor: WidgetStatePropertyAll(appDarkGreen(1)),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: appWhite(1), fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Container(color: appDarkGreen(1), width: 50, height: 2),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //       child: Text(
        //         "or Sign In with",
        //         style: TextStyle(color: appDarkGreen(1), fontSize: 18),
        //       ),
        //     ),
        //     Container(color: appDarkGreen(1), width: 50, height: 2),
        //   ],
        // ),
        // ElevatedButton.icon(
        //   onPressed: () {},
        //   style: ButtonStyle(
        //     elevation: WidgetStatePropertyAll(8),
        //     backgroundColor: WidgetStatePropertyAll(appDarkGreen(0.85)),
        //     padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
        //   ),
        //   icon: Icon(CupertinoIcons.alarm_fill, color: appWhite(1)),
        //   label: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 15),
        //     child: Text(
        //       "Google",
        //       style: TextStyle(color: appWhite(1), fontSize: 20),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
