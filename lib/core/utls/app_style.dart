import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyle{
 static TextStyle textStyle20NotoKufia = GoogleFonts.notoKufiArabic(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

 static TextStyle textStyle18NotoKufia = GoogleFonts.notoKufiArabic(
   fontSize: 18.sp,
   color: Colors.white,
 );
 static TextStyle textStyle14NotoKufia = GoogleFonts.notoKufiArabic(
   fontSize: 14.sp,
   color: Colors.white,
 );
}