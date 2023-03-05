



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import '../../value/color.dart';
import '../common_widget/button_widget.dart';

class PinVerify extends StatefulWidget {
  const PinVerify({Key? key}) : super(key: key);

  @override
  State<PinVerify> createState() => _PinVerifyState();
}

class _PinVerifyState extends State<PinVerify> {

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  String code = "";

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
            SvgPicture.asset("assets/image/pas_forgot.svg",
              height: Get.height/  4,
              width: 100,
            ),
            const SizedBox(height: 20,),
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
            Pinput(
              length: 5,
              autofocus: true,
              // controller: controller.otpController,
              androidSmsAutofillMethod:
              AndroidSmsAutofillMethod.smsRetrieverApi,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyDecorationWith(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: const Color.fromRGBO(234, 239, 243, 1),
                ),
              ),
              showCursor: true,
              onCompleted: (pin) {
                code = pin;
              },
            ),
            const SizedBox(height: 40,),
            ButtonWidget(
                text: "Verify Pin Code",
                textColor: Colors.black,
                backGroundColor: Colors.white,
                mWidth: Get.width,
                mHeight: Get.height,
                borderColor: gradientColors_1,
                press: () async {

                }
            ),
          ],
        ),
      ),
    );
  }
}