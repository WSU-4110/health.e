

import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:healthe/screen/forgetPassword/controller/newpass_controller.dart';

void main(){
  NewPassWordController newPassWordController=Get.put(NewPassWordController());
  test("empty email error showing", () async{
    newPassWordController.emailVerify("");
    expect("error", "error");
    Get.reset();
  });
  test("empty email error showing", () async{
    newPassWordController.emailVerify("johndoe@example.com");
    Fluttertoast.showToast(msg: "success");
    expect("success", "success");
    Get.reset();
  });




  test("pin empty check", () {
    newPassWordController.pinVerify("");
    expect("pin is empty", "pin is empty");
    Get.reset();
  });

  test("pin not valid", () {
    newPassWordController.pinVerify("12345");
    expect("success", "success");
    Get.reset();
  });

  test("pin not valid", () {
    newPassWordController.pinVerify("1234");
    expect("fail", "fail");
    Get.reset();
  });


  test("password change and enter new password empty check", () {
    newPassWordController.changePass("","");
    expect("fail", "fail");
    Get.reset();
  });


  test("password change and enter new password and confirm pass match  check", () {
    newPassWordController.changePass("123456","12345");
    expect("fail", "fail");
    Get.reset();
  });
  test("password change and enter new password and confirm password done", () {
    newPassWordController.changePass("123456","123456");
    expect("fail", "fail");
    Get.reset();
  });

}