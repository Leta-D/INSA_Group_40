import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/auth/auth_controller.dart';
import 'package:kind_bridge/constants/colors.dart';

class SignupWidget extends StatelessWidget {
  SignupWidget({super.key});

  final authController = Get.put(AuthController());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Create an Account",
          style: GoogleFonts.damion(
            color: appDarkGreen(1),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Obx(
            () => TextField(
              cursorColor: appDarkGreen(1),
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
                hintText: "full name",
                hintStyle: TextStyle(color: appBlack(0.6)),
                prefixIcon: Icon(Icons.person, color: appDarkGreen(1)),
                errorText:
                    authController.isValidCridentials.value
                        ? null
                        : "* Insert a valid user name",
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Obx(
            () => TextField(
              cursorColor: appDarkGreen(1),
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
                hintText: "Example@gmail.com",
                hintStyle: TextStyle(color: appBlack(0.6)),
                prefixIcon: Icon(Icons.email, color: appDarkGreen(1)),
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
          padding: const EdgeInsets.only(top: 20.0),
          child: Obx(
            () => TextField(
              cursorColor: appDarkGreen(1),
              obscureText: !authController.isPasswdVisible.value,
              controller: passwdController,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
                hintText: "Atleast 6 characters",
                hintStyle: TextStyle(color: appBlack(0.6)),
                prefixIcon: Icon(Icons.lock, color: appDarkGreen(1)),
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
                        : "* Insert a valid Password",
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
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    print("Leta ==============================");
                    authController.checkSignupValidity(
                      nameController.text,
                      emailController.text,
                      passwdController.text,
                    );
                    if (authController.isValidCridentials.value) {
                      print(nameController.text);
                      print(emailController.text);
                      print(passwdController.text);
                    } else {
                      Get.snackbar(
                        "Account Creation Faild ",
                        "Hmmm... We couldn't create your account. Please use valid credentials and try again.",
                        snackStyle: SnackStyle.FLOATING,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: appRed(0.4),
                        colorText: appWhite(1),
                        duration: Duration(seconds: 2),
                      );
                    }
                  },
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                    backgroundColor: WidgetStatePropertyAll(appDarkGreen(1)),
                  ),

                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: appWhite(1), fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
