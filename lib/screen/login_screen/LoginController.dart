import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../value/constant.dart';
import '../home_screen/home_screen.dart';

class LoginController extends GetxController{
  void userLoginCheck(email,password){
    if (!emailValidatorRegExp.hasMatch(email!) ||
        email!.isEmpty ||
        password!.isEmpty ||
        password!.length <= 6) {
   //   Fluttertoast.showToast(msg: "Please Enter Your valid Info");
    } else {
    //  Get.off(()=> HomeScreen());
    }
    update();
  }
}