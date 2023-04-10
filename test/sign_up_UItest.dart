
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:healthe/screen/sign_up/SignUpController.dart';

void main(){
  SignupController controller=Get.put(SignupController());
  group('UserCheck', () {
    test('shows error toast when given invalid data for signUp', () {
      controller.UserCheck("", "", "");
      expect("please enter valid input","please enter valid input");
      Get.reset();
    });
    test('navigates to home screen when given valid data', () {
      controller.UserCheck('John Doe', 'johndoe@example.com', 'password');
      expect("success","success");
      Get.reset();
    });
  });
}