
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/welcome_screen.dart';

import '../value/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradientColors_1, gradientColors_1],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.5, 0.0),
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  Text(
                    "Everybody Can Train",
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
                  ),
                ],
              ),
              Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: InkWell(
                    onTap: () {

                      Get.to(()=>const WelComeScreen());
                    },
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      decoration: BoxDecoration(color: whiteColors, borderRadius: BorderRadius.circular(99)),
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.normal, color: gradientColors_1),
                      ),
                    ),
                  ))
            ],
          ),
        ));
  }
}