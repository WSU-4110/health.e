



import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/startup_screens/login_screen/login_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:healthe/value/color.dart';
import 'package:healthe/common_widget/button_widget.dart';

class Reset extends StatefulWidget {
  const Reset({Key? key, required void pin, required String email}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {

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
            
            const SizedBox(height: 40,),
            ButtonWidget(
                text: "Password reset link sent. Return to login?",
                textColor: Colors.black,
                backGroundColor: Colors.white,
                mWidth: Get.width,
                mHeight: Get.height,
                borderColor: gradientColors_1,
                press: () async {
                  Get.to(()=> LoginScreen());
                }
            ),
          ],
        ),
      ),
    );
  }
}