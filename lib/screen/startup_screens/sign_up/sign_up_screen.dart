import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/database/auth.dart';
import 'package:healthe/screen/startup_screens/assessment_screen.dart';
import 'package:healthe/value/color.dart';
import '../../../common_widget/button_widget.dart';
import '../../../database/crud.dart';
import '../../home_screen/home_screen.dart';
import '../login_screen/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String? email = "";
  late String? password = "";
  late String? confirmPassword = "";
  late String? name = "";
  late bool passShow = true;
  String? errorMessage = '';

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Text Controllers
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerGender = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerHeight = TextEditingController();


  // Convert age + height to int
  late int age = int.parse(_controllerAge.text);
  late int height = int.parse(_controllerHeight.text);
  bool loading = false;

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        context: context,
      );
      Get.off(() => HomeScreen());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

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
            Expanded(
              child: SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Create Account",
                        style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            fontSize: 23),
                      ),

                      SizedBox(
                        height: Get.height / 11,
                      ),

                      // Name
                      Container(
                        padding:
                        const EdgeInsets.only(left: 15, bottom: 5, top: 5),
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
                            _controllerUsername.text = value;
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

                      // Email
                      Container(
                        padding:
                        const EdgeInsets.only(left: 15, bottom: 5, top: 5),
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
                            _controllerEmail.text = value;
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

                      // Create Password
                      Container(
                        padding:
                        const EdgeInsets.only(left: 15, bottom: 5, top: 5),
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
                            _controllerPassword.text = value;
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
                                  icon: Icon(passShow == true
                                      ? Icons.lock
                                      : Icons.lock_open))),
                        ),
                      ),


                      SizedBox(
                        height: Get.height / 24,
                      ),

                      // Confirm Password
                      Container(
                        padding:
                        const EdgeInsets.only(left: 15, bottom: 5, top: 5),
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
                            _controllerConfirmPassword.text = value;
                          },

                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                          ),
                          decoration: const InputDecoration(
                            hintText: "confirm password",
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

                      // Row for Age, Gender, and Height
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Age
                          Container(
                            padding:
                            const EdgeInsets.only(left: 5, bottom: 5, top: 5),
                            width: 85.0,
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
                                _controllerAge.text = value;
                                var intValue = int.parse(_controllerAge.text);


                              },

                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                              decoration: const InputDecoration(
                                  hintText: "Age",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  ),
                            ),
                          ),

                          const SizedBox(
                            width: 20.0,
                          ),


                          // Gender
                          Container(
                            padding:
                            const EdgeInsets.only(left: 0, bottom: 5, top: 5),
                            width: 85.0,
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
                                _controllerGender.text = value;
                              },

                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                              decoration: const InputDecoration(
                                  hintText: "Gender",
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  ),
                            ),
                          ),

                          const SizedBox(
                            width: 20.0,
                          ),

                          // Height
                          Container(
                            padding:
                            const EdgeInsets.only(left: 0, bottom: 5, top: 5),
                            width: 85.0,
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
                                _controllerHeight.text = value;
                              },

                              style: GoogleFonts.inter(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                              ),
                              decoration: InputDecoration(
                                hintText: "Height",
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                              ),
                            ),
                          ),



                        ],
                      ),



                      SizedBox(
                        height: Get.height / 24,
                      ),



                      loading
                          ? CircularProgressIndicator()
                          : ButtonWidget(
                        text: "SIGN UP",
                        textColor: Colors.black,
                        backGroundColor: Colors.white,
                        mWidth: Get.width,
                        mHeight: Get.height,
                        borderColor: gradientColors_1,
                        press: () async {
                          setState(() {
                            loading = true;
                          });
                          if (_controllerEmail.text == "" || _controllerPassword.text == "") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("All fields are required!"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else if (_controllerPassword.text != _controllerConfirmPassword.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Passwords do not match!"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } else {
                            User? result = await Auth().createUserWithEmailAndPassword(
                              email: _controllerEmail.text,
                              password: _controllerPassword.text,
                              context: context,
                            );
                            if (result != null) {
                              try {
                                await Crud().createUserProfile(
              
                                  _controllerUsername.text,
                                  //
                                  _controllerEmail.text,
                                  _controllerPassword.text,
                                  0,
                                  // level
                                  0,
                                  // weight
                                  height,
                                  // height
                                  age,
                                  // age
                                  _controllerGender.text,
                                  // gender
                                  "",
                                  // goal
                                  0,
                                  // dailyCaloricIntake
                                  "",
                                  // lastAssessmentDate
                                  [],
                                  // workoutHistory
                                  true, // notificationsEnabled
                                );
                               Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => QuizScreen()),

                                );
                              } catch (e) {
                                print('Error creating user profile: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Error creating user profile"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
    }
                          setState(() {
                            loading = false;
                          });
                        },
                      ),

                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Get.off(() => LoginScreen());
                          },
                          child: Text(
                            "I have an account",
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
                                    colors: [
                                      Colors.white.withOpacity(0.1),
                                      Colors.white
                                    ],
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
                                    colors: [
                                      Colors.white,
                                      Colors.white.withOpacity(0.2)
                                    ],
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
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: SignInButton(
                          Buttons.Google,
                          text: "Continue with Google",
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            print("Signing in with Google...");
                            try {
                              await Auth.signInWithGoogle(context: context);
                            } catch (e) {
                              print("Error signing in with Google: $e");
                            }
                            setState(() {
                              loading = false;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 27,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}