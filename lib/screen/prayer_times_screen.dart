import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times/utls/app_style.dart';
class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  _PrayerTimesScreenState createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  String selectedCountry = "مصر";
  String selectedCity = "القاهرة";

  Duration timeLeft = const Duration(hours: 1, minutes: 33, seconds: 59);

  @override
  void initState() {
    super.initState();
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (mounted) {
    //     setState(() {
    //       if (timeLeft.inSeconds > 0) {
    //         timeLeft = timeLeft - const Duration(seconds: 1);
    //       }
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('EEEE d MMMM yyyy', 'ar').format(DateTime.now());

    return  Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // اختيار الدولة
            DropdownButtonFormField<String>(
              value: selectedCountry,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: ["مصر", "السعودية", "الإمارات"].map((String country) {
                return DropdownMenuItem<String>(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedCountry = value!);
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCity,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              items: ["القاهرة", "الإسكندرية", "الرياض", "دبي"].map((String city) {
                return DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (value) {
                setState(() => selectedCity = value!);
              },
            ),
            const SizedBox(height: 20),
            // عرض المدينة والتاريخ
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$selectedCountry - $selectedCity",
                  style:AppStyle.textStyle20NotoKufia,
                ),
                const SizedBox(height: 10),
                Text(
                  "اليوم: $todayDate هـ",
                  style:AppStyle.textStyle18NotoKufia
                ),
              ],
            ),
            const SizedBox(height: 10),
            // اختيار المدينة
            const SizedBox(height: 20),
            // عرض الوقت الحالي
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                return Text(
                  "الساعة الآن ${DateFormat('hh:mm:ss a', 'ar').format(DateTime.now())} ",
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                );
              },
            ),
            const SizedBox(height: 20),
            // العداد التنازلي
            const Text(
              "باقي على الظهر",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _timeBox((timeLeft.inSeconds % 60).toString().padLeft(2, '0')),
                const Text(" : ", style: TextStyle(fontSize: 24, color: Colors.white)),
                _timeBox((timeLeft.inMinutes % 60).toString().padLeft(2, '0')),
                const Text(" : ", style: TextStyle(fontSize: 24, color: Colors.white)),
                _timeBox(timeLeft.inHours.toString().padLeft(2, '0')),
              ],
            ),
            const SizedBox(height: 20),

          ],
        ),
      ],
    );
  }

  Widget _timeBox(String value) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
// زر التفعيل
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     const Text(
//       "تفعيل خدمة إشعارات مواقيت الصلاة",
//       style: TextStyle(fontSize: 16, color: Colors.white),
//     ),
//     Switch(
//       value: true,
//       onChanged: (val) {},
//     ),
//   ],
// ),