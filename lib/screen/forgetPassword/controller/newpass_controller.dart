import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../value/constant.dart';
import '../../login_screen/login_screen.dart';
import '../password_change.dart';
import '../pin_verify.dart';

class NewPassWordController extends GetxController{

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
  void emailVerify(email){
    if (!emailValidatorRegExp.hasMatch(email!) ||
        email!.isEmpty ) {
      Fluttertoast.showToast(msg: "Please Enter Your valid Email");

    }else{
      Get.to(()=>const PinVerify());
    }
  }

  void pinVerify(String pin){
    if(pin.isNotEmpty || pin.length==5){
      Get.to(()=>const ChangePassScreen());

    }else{
      // go to next screen
      Fluttertoast.showToast(msg: "pin is not valid");
    }
  }

  void changePass(passwords,confirmPasswords){
    if(passwords==null || confirmPasswords ==null){
      Fluttertoast.showToast(msg: "password and confirm pass is empty");
    }else{
      setLoadingTrue();

      if (passwordController.text.isNotEmpty &&
          passwords == confirmPasswords) {

        Get.off(()=>const LoginScreen ());
        setLoadingFalse();
      } else {
        setLoadingFalse();
      }

    }

  }

}