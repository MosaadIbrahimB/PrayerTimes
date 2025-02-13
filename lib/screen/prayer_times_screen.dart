import 'dart:async';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri/jHijri.dart';
import 'package:flutter/material.dart';
import 'package:prayer_times/utls/app_style.dart';
import 'package:prayer_times/widget/time_now_widget.dart';
import 'package:prayer_times/widget/today_name_and_date_widget.dart';

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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          CDropdownButtonFormFieldWidget(value: selectedCountry, list: ["مصر", "السعودية", "الإمارات"]),
          const SizedBox(height: 20),
          CDropdownButtonFormFieldWidget(value: selectedCity, list: ["القاهرة", "الإسكندرية", "الرياض", "دبي"]),
          const SizedBox(height: 20),
          Text(
            "$selectedCountry - $selectedCity",
            style: AppStyle.textStyle20NotoKufia,
          ),
          const SizedBox(height: 15),
          TodayNameAndDateWidget(),
          const SizedBox(height: 10),
          const SizedBox(height: 20),
          // عرض الوقت الحالي
          TimeNowWidget(),
          const SizedBox(height: 20),
          // العداد التنازلي
          const Text(
            "باقي على الظهر",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _timeBox((timeLeft.inSeconds % 60).toString().padLeft(2, '0')),
              const Text(" : ",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              _timeBox((timeLeft.inMinutes % 60).toString().padLeft(2, '0')),
              const Text(" : ",
                  style: TextStyle(fontSize: 24, color: Colors.white)),
              _timeBox(timeLeft.inHours.toString().padLeft(2, '0')),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
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
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}



class CDropdownButtonFormFieldWidget extends StatelessWidget {
  final   String value ;
  final   List<String> list ;
  const CDropdownButtonFormFieldWidget({super.key, required this.value, required this.list});

  @override
  Widget build(BuildContext context) {
    return      DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      items: list.map((String country) {
        return DropdownMenuItem<String>(
          value: country,
          child: Text(country),
        );
      }).toList(),
      onChanged: (value) {
        // setState(() => selectedCountry = value!);
      },
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
