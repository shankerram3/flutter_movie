import 'dart:ffi';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class ModText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? size ;

  const ModText(
      {this.text, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,style: GoogleFonts.breeSerif(
      color:color,
      fontSize: size,
    ),

    );
  }
}
