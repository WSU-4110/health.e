

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../value/constant.dart';

class SignupController  extends GetxController{
  void UserCheck(name ,email,password){
    if (!emailValidatorRegExp.hasMatch(email!) ||
        email!.isEmpty ||
        password!.isEmpty ||
        password!.length <= 6 ||
        name!.isEmpty) {
    //  Fluttertoast.showToast(msg: "Please Enter Your valid Info");
    } else {
      // Get.off(()=>const HomeScreenPage());
    //  Fluttertoast.showToast(msg: "You are valid ");
    }
    update();
  }
}