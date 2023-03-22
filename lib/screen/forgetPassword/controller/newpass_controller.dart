import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../value/constant.dart';

class NewPassWordController extends GetxController{

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  RxString passwords = "".obs;
  RxString confirmPasswords = "".obs;
  final count = 0.obs;



  /// new password create an api call to server

  RxBool isLoading = false.obs;
  RxBool errorCheck = false.obs;
  RxString messageError = "".obs;

  setLoadingFalse() {
    isLoading(false);
    update();
  }

  setLoadingTrue() {
    isLoading(true);
    update();
  }
  bool reEnterobscureText = true;

  void reEntertogglePasswordObscure() {
    reEnterobscureText = !reEnterobscureText;
    update();
  }

  /// new password text hide and show
  bool obscureText = true;

  void togglePasswordObscure() {
    obscureText = !obscureText;
    update();
  }

  /// password validation
  ///
  RxBool password = false.obs;
  RxString passwordErrorMessage = "".obs;

  setPasswordFalse() {
    password(false);
    update();
  }

  setPasswordTrue() {
    password(true);
    update();
  }

  passwordValidation(errorId) {
    if (errorId == 1) {
      setPasswordTrue();
      passwordErrorMessage(kPassNullError);
    } else if (errorId == 2) {
      setPasswordTrue();
      passwordErrorMessage(kShortPassError);
    }

    update();
  }

  /// re -enter  password validation
  ///
  RxBool reEnterPassword = false.obs;
  RxString reEnterPasswordErrorMessage = "".obs;

  setReEnterPasswordFalse() {
    reEnterPassword(false);
    update();
  }

  setReEnterPasswordTrue() {
    reEnterPassword(true);
    update();
  }

  reEnterPasswordValidation(errorId) {
    if (errorId == 1) {
      setReEnterPasswordTrue();
      reEnterPasswordErrorMessage(kPassNullError);
    } else if (errorId == 2) {
      setReEnterPasswordTrue();
      reEnterPasswordErrorMessage(kMatchPassError);
    }

    update();
  }

}