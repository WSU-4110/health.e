
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../value/color.dart';
import '../common_widget/button_widget.dart';
import '../login_screen/login_screen.dart';
import '../widget/error_message_widget.dart';
import 'controller/newpass_controller.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({Key? key}) : super(key: key);

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  NewPassWordController controller = Get.put(NewPassWordController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;
    return GetBuilder<NewPassWordController>(builder: (logic) {
      return Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
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
              children: [
                Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: mediaHeight / 15,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(
                              left: 12,
                            ),
                            child: Text(
                              "Create New Password",
                              style: GoogleFonts.inter(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 12, top: 10),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "Your new password must be different from \n",
                                    style: GoogleFonts.inter(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
                                TextSpan(
                                    text: " previously used password ",
                                    style: GoogleFonts.inter(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      height: 1.5,
                                      fontSize: 15,
                                      color: Colors.white,
                                    )),
                              ]),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SvgPicture.asset("assets/image/password_c.svg",
                            // color: Colors.white,
                            height: Get.height/  4,
                            width: 100,
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "New Password",
                                style: GoogleFonts.inter(
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              )),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            width: double.maxFinite,
                            height: mediaHeight / 16,
                            decoration: BoxDecoration(
                              color: boxBackColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: borderColor, width: 1),
                            ),
                            child: TextFormField(
                              autofocus: true,
                              controller: logic.passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: logic.obscureText,
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                              onChanged: (value) {
                                logic.setPasswordFalse();
                                logic.passwords(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  logic.passwordValidation(1);
                                } else if (value.length < 6) {
                                  logic.passwordValidation(2);
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "**********",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      logic.togglePasswordObscure();
                                    },
                                    child: logic.obscureText
                                        ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )
                                        :  Icon(Icons.visibility, color: gradientColors_1)),
                              ),
                            ),
                          ),
                          ErrorMessageWidget(
                            checker: logic.password,
                            message: logic.passwordErrorMessage,
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              " Re-enter Password",
                              style: GoogleFonts.inter(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 15),
                            width: double.maxFinite,
                            height: mediaHeight / 16,
                            decoration: BoxDecoration(
                              color: boxBackColor,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: borderColor, width: 1),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: logic.confirmPasswordController,
                              obscureText: logic.reEnterobscureText,
                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                              onChanged: (value) {
                                logic.setReEnterPasswordFalse();
                                logic.confirmPasswords(value);
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  logic.reEnterPasswordValidation(1);
                                } else if (value != logic.passwordController.text) {
                                  logic.reEnterPasswordValidation(2);
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "**********",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    logic.reEntertogglePasswordObscure();
                                  },
                                  child: logic.reEnterobscureText
                                      ? const Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey,
                                  )
                                      :  Icon(Icons.visibility, color: gradientColors_1),
                                ),
                              ),
                            ),
                          ),
                          ErrorMessageWidget(
                            checker: logic.reEnterPassword,
                            message: logic.reEnterPasswordErrorMessage,
                          ),
                          const SizedBox(
                            height: 33,
                          ),
                          logic.isLoading == true
                              ? const Center(
                            child: CircularProgressIndicator(),
                          )
                              : ButtonWidget(
                            text: "Create Password",
                            textColor: Colors.black54,
                            backGroundColor: Colors.white,
                            mWidth: mediaWidth,
                            mHeight: mediaHeight,
                            borderColor: Colors.white,
                            press: () async {
                              if (_formKey.currentState!.validate()) {
                                logic.setLoadingTrue();

                                if (controller.passwordController.text.isNotEmpty &&
                                    logic.passwords == logic.confirmPasswords) {

                                  Get.off(()=>const LoginScreen ());
                                  logic.setLoadingFalse();
                                } else {
                                  logic.setLoadingFalse();
                                }
                              } else {
                                logic.setLoadingFalse();
                              }
                            },
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}