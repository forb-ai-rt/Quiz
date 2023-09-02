import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyleText extends StatelessWidget {
  const StyleText({required this.text, super.key});

  final String text;
  @override
  Widget build(context) {
    return Center(
      child: Text(
        text,
        style:GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 23.9,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
