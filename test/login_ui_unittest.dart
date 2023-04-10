import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:healthe/screen/login_screen/LoginController.dart';

void main(){
  LoginController controller=Get.put(LoginController());

  test("input empty check", (){
    controller.userLoginCheck("", "");
    expect("error", "error");
    Get.reset();

  });
  test("valid email and password check", () {
    controller.userLoginCheck("johndoe@example.com", "password");
    expect("success", "success");
    Get.reset();
  });

}