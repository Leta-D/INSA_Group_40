import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/auth/auth_controller.dart';
import 'package:kind_bridge/auth/widgets/login_widget.dart';
import 'package:kind_bridge/auth/widgets/signup_widget.dart';
import 'package:kind_bridge/constants/colors.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: appWhite(1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: screenSize.height / 4.5,
                width: screenSize.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: appBlack(1),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: appDarkGreen(1),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "Small Acts, Big Changes",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.daiBannaSil(
                          color: appWhite(1),
                          fontSize: 30,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Obx(
                            () =>
                                authController.userRole.value == "Donor"
                                    ? TextButton(
                                      onPressed: () {
                                        authController.authPageIndex.value = 0;
                                      },
                                      child: Text(
                                        "Sign up",
                                        style: TextStyle(
                                          color: appWhite(1),
                                          fontSize:
                                              authController
                                                          .authPageIndex
                                                          .value ==
                                                      0
                                                  ? 25
                                                  : 20,
                                          fontWeight:
                                              authController
                                                          .authPageIndex
                                                          .value ==
                                                      0
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                        ),
                                      ),
                                    )
                                    : SizedBox(width: 20),
                          ),
                          TextButton(
                            onPressed: () {
                              authController.authPageIndex.value = 1;
                            },
                            child: Obx(
                              () => Text(
                                "Sign In",
                                style: TextStyle(
                                  color: appWhite(1),
                                  fontSize:
                                      authController.authPageIndex.value == 1
                                          ? 25
                                          : 20,
                                  fontWeight:
                                      authController.authPageIndex.value == 1
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height / 1.5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 30,
                  ),
                  child: Obx(
                    () =>
                        [SignupWidget(), LoginWidget()][authController
                            .authPageIndex
                            .value],
                  ),
                ),
              ),
              Container(
                height: screenSize.height / 9.5,
                width: screenSize.width,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(225, 0, 0, 0),
                      blurRadius: 5,
                      spreadRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: appDarkGreen(1),
                ),
                child: Center(
                  child: Text(
                    "Kind Bridge © 2025",
                    style: GoogleFonts.alumniSans(
                      color: appWhite(1),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
