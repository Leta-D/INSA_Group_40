import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  var authPageIndex = 0.obs;

  var isPasswdVisible = false.obs;

  var isValidCridentials = true.obs;

  void checkSignupValidity(String name, String email, String passwd) {
    if (email.trim().isNotEmpty &&
        passwd.trim().isNotEmpty &&
        name.trim().isNotEmpty) {
      if (passwd.length >= 6) {
        isValidCridentials.value = true;
        return;
      }
    }
    isValidCridentials.value = false;
  }

  void checkLoginValidity(String email, String passwd) {
    if (email.trim().isNotEmpty && passwd.trim().isNotEmpty) {
      if (passwd.length >= 6) {
        isValidCridentials.value = true;
        return;
      }
    }
    isValidCridentials.value = false;
  }
}
