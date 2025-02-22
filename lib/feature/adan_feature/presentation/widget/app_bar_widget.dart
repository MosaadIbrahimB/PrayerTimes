import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text("مواقيت الصلاة", style: GoogleFonts.notoKufiArabic(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),),
    );
  }

  @override
  Size get preferredSize => Size(0,52);
}
