



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/startup_screens/forgetPassword/pin_verify.dart';

import 'package:healthe/value/color.dart';
import 'package:healthe/common_widget/button_widget.dart';

class EmailVerify extends StatefulWidget {
  const EmailVerify({Key? key}) : super(key: key);

  @override
  State<EmailVerify> createState() => _EmailVerifyState();
}

class _EmailVerifyState extends State<EmailVerify> {

  late String? email = "";


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
            SvgPicture.asset("assets/image/verify.svg",
              height: Get.height/  4,
              width: 100,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Health.",
                  style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: blackColors),
                ),
                Text(
                  "E",
                  style: GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.bold, color: whiteColors),
                )
              ],
            ),

            const SizedBox(height: 40,),
            Container(
              padding: const EdgeInsets.only(left: 15, bottom: 5, top: 5),
              width: double.maxFinite,
              // height: mHeight / 16,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                //  controller: controller.nameController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
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
            const SizedBox(height: 40,),
            ButtonWidget(
                text: "Verify Email",
                textColor: Colors.black,
                backGroundColor: Colors.white,
                mWidth: Get.width,
                mHeight: Get.height,
                borderColor: gradientColors_1,
                press: () async {
                  Get.to(()=>PinVerify());
                }
            ),
          ],
        ),
      ),
    );
  }
}