import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/login_screen/login_screen.dart';

import '../value/color.dart';
import 'assisment_screen/assisment_screen.dart';

class WelComeScreen extends StatefulWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  State<WelComeScreen> createState() => _WelComeScreenState();
}

class _WelComeScreenState extends State<WelComeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.only(left: 15, right: 15),
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
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Your Daily Workout",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 36, fontWeight: FontWeight.bold, color: blackColors),
                    ),
                  ),
                  Text(
                    "Companion",
                    style: GoogleFonts.poppins(fontSize: 50, fontWeight: FontWeight.bold, color: whiteColors),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Enhance your workout experience with our latest workout app",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
                    ),
                  ),
                ],
              ),
              Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(()=> QuizScreen());
                        },
                        child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 15, right: 15),
                            decoration: BoxDecoration(
                              color: whiteColors,
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: Row(
                              children: [
                                const Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Join Health.E",
                                      style: GoogleFonts.poppins(
                                          fontSize: 20, fontWeight: FontWeight.normal, color: gradientColors_1),
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(right: 15),
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [gradientColors_1, gradientColors_1],
                                                begin: const FractionalOffset(0.0, 0.0),
                                                end: const FractionalOffset(0.5, 0.0),
                                              ),
                                              borderRadius: BorderRadius.circular(20)),
                                          child: const Icon(Icons.arrow_circle_right_outlined),
                                        )
                                      ],
                                    )),
                              ],
                            )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(()=>const LoginScreen());
                        },
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            border: Border.all(color: Colors.white, width: 2),
                            gradient: LinearGradient(
                              colors: [gradientColors_1, gradientColors_1],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(0.5, 0.0),
                            ),
                          ),
                          child: Text(
                            "LOGIN",
                            style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.normal, color: blackColors),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
