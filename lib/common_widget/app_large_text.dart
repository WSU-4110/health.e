import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;

  AppLargeText({Key? key,
    required this.size,
    required this.text,
    required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: GoogleFonts.ibarraRealNova(
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
        )
    );
  }
}