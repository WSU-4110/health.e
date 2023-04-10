

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../value/color.dart';
import '../../value/constant.dart';
import '../common_widget/button_widget.dart';
import '../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';
import 'SignUpController.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String? email = "";
  late String? password = "";
  late String? name = "";
  late bool passShow = true;
  SignupController controller=Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Create A Account",
                      style:
                      GoogleFonts.poppins(fontStyle: FontStyle.normal, fontWeight: FontWeight.w700, fontSize: 23),
                    ),
                    SizedBox(
                      height: Get.height / 11,
                    ),
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
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          name = value;
                        },

                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Name",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 24,
                    ),
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
                          hintText: "Email",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 24,
                    ),
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
                        keyboardType: TextInputType.text,
                        obscureText: passShow,
                        onChanged: (value) {
                          password = value;
                        },

                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                        ),
                        decoration: InputDecoration(
                            hintText: "password",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (passShow == false) {
                                      passShow = true;
                                    } else {
                                      passShow = false;
                                    }
                                  });
                                },
                                icon: Icon(passShow == true ? Icons.lock : Icons.lock_open))),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 24,
                    ),
                    ButtonWidget(
                      text: "SIGN UP",
                      textColor: Colors.black,
                      backGroundColor: Colors.white,
                      mWidth: Get.width,
                      mHeight: Get.height,
                      borderColor: gradientColors_1,
                      press: () async {
                    controller.UserCheck(name, email, password);
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.off(() => const LoginScreen());
                        },
                        child: Text(
                          "I  have an account?",
                          style: GoogleFonts.inter(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: 1,
                              margin: const EdgeInsets.only(right: 15),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white.withOpacity(0.1), Colors.white],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(0.5, 0.0),
                                ),
                              ),
                            )),
                        const Text("Or"),
                        Expanded(
                            child: Container(
                              height: 1,
                              margin: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.white, Colors.white.withOpacity(0.2)],
                                  begin: const FractionalOffset(0.0, 0.0),
                                  end: const FractionalOffset(0.9, 0.0),
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 27,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white, width: 2)),
                          child: const Image(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1662070479020-73f77887c87c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1454&q=80",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white, width: 2)),
                          child: const Image(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1612994370726-5d4d609fca1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.white, width: 2)),
                          child: const Image(
                            image: NetworkImage(
                              "https://images.unsplash.com/photo-1573804633927-bfcbcd909acd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1527&q=80",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
