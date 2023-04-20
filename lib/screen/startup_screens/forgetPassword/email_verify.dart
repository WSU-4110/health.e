import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/startup_screens/forgetPassword/password_reset.dart';

import 'package:healthe/value/color.dart';
import 'package:healthe/common_widget/button_widget.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String? pin = "";
  var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
      url: 'https://www.example.com/finishSignUp?cartId=1234',
      // This must be true
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.android',
      // installIfNotAvailable
      androidInstallApp: true,
      // minimumVersion
      androidMinimumVersion: '12');
  Future<void> _sendPinToEmail(String email) async {
    try {
      // Generate a random 5 digit pin
      final random = Random();
      final pin = random.nextInt(90000) + 10000;

      // Send the pin to the user's email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

      // Navigate to the Reset screen
      Get.to(() => Reset(pin: pin.toString(), email: email));
    } catch (e) {
      // Show an error message if there was an error sending the email
      Get.snackbar(
        "Error",
        "Failed to send email. Please try again later.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void _sendVerificationEmail() async {
    try {
      var emailAuth = 'someemail@domain.com';
      FirebaseAuth.instance
          .sendSignInLinkToEmail(email: emailAuth, actionCodeSettings: acs)
          .catchError(
              (onError) => print('Error sending email verification $onError'))
          .then((value) => print('Successfully sent email verification'));
      Get.to(() => Reset(pin: pin.toString(), email: email));
    } catch (e) {
      print(e);
      // Show error message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 15, right: 15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientColors_1, gradientColors_1],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/image/verify.svg",
              height: Get.height / 4,
              width: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Health.",
                  style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: blackColors),
                ),
                Text(
                  "E",
                  style: GoogleFonts.poppins(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: whiteColors),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 5, top: 5),
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                //  controller: controller.nameController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },

                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter your Email",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ButtonWidget(
                text: "Verify Email",
                textColor: Colors.black,
                backGroundColor: Colors.white,
                mWidth: Get.width,
                mHeight: Get.height,
                borderColor: gradientColors_1,
                press: () async {
                  if (email != null && email.isNotEmpty) {
                    final results = _sendPinToEmail(email);
                    if (pin != null) {
                      Get.to(() => Reset(pin: results, email: email));
                    } else {
                      // Handle error
                      print('Failed to send verification email');
                    }
                  } else {
                    // Show error message for invalid email
                    print('Invalid email address');
                  }
                }),
          ],
        ),
      ),
    );
  }
}
