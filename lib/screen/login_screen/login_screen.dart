import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthe/screen/forgetPassword/email_verify.dart';
import 'package:healthe/screen/home_screen/home_screen.dart';
import 'package:healthe/value/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthe/auth.dart';import 'package:firebase_auth/firebase_auth.dart';
import 'package:healthe/auth.dart';
import 'package:provider/provider.dart';
import '../../provider/google_sign_in.dart';
import '../../value/constant.dart';
import '../assessment_screen/assessment_screen.dart';
import '../common_widget/button_widget.dart';
import '../sign_up/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String? email = "";
  late String? password = "";
  String? errorMessage = '';
  bool isLogin = true;
  late bool passShow = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInwithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('HealthE');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
        onPressed: isLogin
            ? signInWithEmailAndPassword
            : createUserWithEmailAndPassword,
        child: Text(isLogin ? 'Login' : 'Register'));
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
      ),
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
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _entryField('email', _controllerEmail),
                    _entryField('password', _controllerPassword),
                    _errorMessage(),
                    _submitButton(),
                    _loginOrRegisterButton(),
                    Text(
                      "Welcome Back",
                      style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w700,
                          fontSize: 23),
                    ),
                    SizedBox(
                      height: Get.height / 11,
                    ),
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
                                icon: Icon(passShow == true
                                    ? Icons.lock
                                    : Icons.lock_open))),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 24,
                    ),
                    ButtonWidget(
                      text: "LOGIN",
                      textColor: Colors.black,
                      backGroundColor: Colors.white,
                      mWidth: Get.width,
                      mHeight: Get.height,
                      borderColor: gradientColors_1,
                      press: () async {
                        if (!emailValidatorRegExp.hasMatch(email!) ||
                            email!.isEmpty ||
                            password!.isEmpty ||
                            password!.length <= 6) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Your valid Info");
                        } else {
                          Get.off(() => HomeScreen());
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => EmailVerify());
                      },
                      child: Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.inter(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => QuizScreen());
                        },
                        child: Text(
                          "I don't have an account?",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.white, width: 2)),
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
                              border:
                                  Border.all(color: Colors.white, width: 2)),
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
                              border:
                                  Border.all(color: Colors.white, width: 2)),
                                  
                          child: OutlinedButton.icon(
                          label: const Text(
                          'Sign In With Google',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),

            icon: const FaIcon(FontAwesomeIcons.google, color: Color.fromARGB(255, 29, 62, 173)),
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.login();
            },
        ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
