import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatelessWidget {
   TextWidget({super.key,required this.text,required this.fontSize,required this.fontweight,required this.textColor });
  String text;
  double fontSize;
  FontWeight fontweight;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.openSans(fontSize: fontSize,fontWeight: fontweight,color: textColor ),);
  }
}