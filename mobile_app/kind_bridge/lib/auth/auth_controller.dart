import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:kind_bridge/constants/colors.dart';

class AuthController extends GetxController {
  var authPageIndex = 0.obs;

  var isPasswdVisible = false.obs;

  var isValidCridentials = true.obs;

  String userRole = "";

  Future<void> checkSignupValidity(
    String name,
    String email,
    String passwd,
  ) async {
    try {
      if (email.trim().isNotEmpty &&
          passwd.trim().isNotEmpty &&
          name.trim().isNotEmpty) {
        if (passwd.length >= 6) {
          isValidCridentials.value = true;
          signUpWithEmail(email, passwd).then((result) {
            if (result == null) {
              // Successfully signed up
              print("User signed up successfully");
              // Optionally, navigate to the home page or another page after successful signup
              // Get.to(HomePage());
            } else {
              // Handle signup error
              Get.snackbar(
                "Signup Failed",
                result,
                snackStyle: SnackStyle.FLOATING,
                snackPosition: SnackPosition.TOP,
                backgroundColor: appRed(0.4),
                colorText: appWhite(1),
                duration: Duration(seconds: 2),
              );
            }
          });

          return;
        }
      }
      isValidCridentials.value = false;
    } catch (e) {
      print(e);
    }
  }

  void checkLoginValidity(String email, String passwd) {
    if (email.trim().isNotEmpty && passwd.trim().isNotEmpty) {
      if (passwd.length >= 6) {
        isValidCridentials.value = true;
        signInWithEmail(email, passwd).then((result) {
          if (result == null) {
            // Successfully logged in
            print("User logged in successfully");
            // Optionally, navigate to the home page or another page after successful login
            // Get.to(HomePage());
          } else {
            // Handle login error
            Get.snackbar(
              "Login Failed",
              result,
              snackStyle: SnackStyle.FLOATING,
              snackPosition: SnackPosition.TOP,
              backgroundColor: appRed(0.4),
              colorText: appWhite(1),
              duration: Duration(seconds: 2),
            );
          }
        });
        return;
      }
    }
    isValidCridentials.value = false;
  }

  Future<String?> signInWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String?> signUpWithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // success
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize any necessary resources or state here
  }

  @override
  void onClose() {
    // Clean up resources if needed
    super.onClose();
  }
}
