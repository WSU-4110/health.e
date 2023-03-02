import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:google_fonts/google_fonts.dart';



class ButtonWidget extends StatelessWidget {
  final text;
  final Color backGroundColor;
  final Color textColor;
  final Color borderColor;
  final Callback press;
  final mHeight;
  final mWidth;

  const ButtonWidget(
      {Key? key,
        this.text,
        required this.backGroundColor,
        required this.press,
        this.mHeight,
        this.mWidth,
        required this.textColor,
        required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: mHeight / 15,
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: borderColor, width: 1)),
        child: Text(
          text,
          style: GoogleFonts.inter(
              fontStyle: FontStyle.normal, fontWeight: FontWeight.w600, fontSize: 18, color: textColor),
        ),
      ),
    );
  }
}
