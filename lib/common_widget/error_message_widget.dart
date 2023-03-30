

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorMessageWidget extends StatelessWidget {
  final RxString  message;

  final RxBool checker;
  const ErrorMessageWidget({Key? key, required this.message, required this.checker,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        Obx(() {
          return checker==true? Row(
            children: [
              const Icon(Icons.error, color: Colors.red, size: 12,),
              const SizedBox(
                width: 5,
              ),
              Text("$message", style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.red,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal
              ),)
            ],
          ):Container();
        }),
      ],
    );
  }
}