import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyle {
  static TextStyle textStyle20NotoKufia(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 20.sp, // الآن سيتم استدعاؤه بعد التهيئة
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle textStyle18NotoKufia(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 18.sp,
      color: Colors.white,
    );
  }

  static TextStyle textStyle14NotoKufia(BuildContext context) {
    return GoogleFonts.notoKufiArabic(
      fontSize: 14.sp,
      color: Colors.white,
    );
  }
}


