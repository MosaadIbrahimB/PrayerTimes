import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyle{
 static TextStyle textStyle20NotoKufia = GoogleFonts.notoKufiArabic(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

 static TextStyle textStyle18NotoKufia = GoogleFonts.notoKufiArabic(
   fontSize: 18,
   color: Colors.white,
 );
}