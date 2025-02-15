import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prayer_times/feature/presentation/screen/prayer_times_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg1.png"),
            fit: BoxFit.cover,
          ),
        ),  
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(

            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text("مواقيت الصلاة", style: GoogleFonts.notoKufiArabic(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
            body: Directionality(
                textDirection: TextDirection.rtl,child: PrayerTimesScreen()),
          ),
        ),
      ),
    );
  }
}




