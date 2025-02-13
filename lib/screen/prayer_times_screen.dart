import 'dart:async';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:jhijri/jHijri.dart';
import 'package:flutter/material.dart';
import 'package:prayer_times/utls/app_style.dart';
import 'package:prayer_times/widget/c_dropdown_button_form_field_widget.dart';
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
          CDropdownButtonFormFieldWidget(
              value: selectedCountry, list: ["مصر", "السعودية", "الإمارات"]),
          const SizedBox(height: 10),
          CDropdownButtonFormFieldWidget(
              value: selectedCity,
              list: ["القاهرة", "الإسكندرية", "الرياض", "دبي"]),
          const SizedBox(height: 10),
          Text(
            "$selectedCountry - $selectedCity",
            style: AppStyle.textStyle20NotoKufia,
          ),
          const SizedBox(height: 15),
          TodayNameAndDateWidget(),
          const SizedBox(height: 10),
          // عرض الوقت الحالي
          TimeNowWidget(),
          const SizedBox(height: 10),
          // العداد التنازلي
          Align(
              alignment: Alignment.center,
              child: Text(
                "باقي على الظهر",
                style: AppStyle.textStyle18NotoKufia,
              )),
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
          const SizedBox(height: 15),

          Expanded(child: PrayerTableWidget())
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
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class PrayerTableWidget extends StatelessWidget {
  final List<Map<String, String>> prayerTimes = [
    {"name": "صلاة الفجر", "time": "05:10 ص"},
    {"name": "الشروق", "time": "06:37 ص"},
    {"name": "صلاة الظهر", "time": "12:09 م"},
    {"name": "صلاة العصر", "time": "03:17 م"},
    {"name": "صلاة المغرب", "time": "05:42 م"},
    {"name": "صلاة العشاء", "time": "06:59 م"},
  ];

  PrayerTableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // ثلاث أعمدة
        childAspectRatio: 1 / .6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: prayerTimes.length,
      itemBuilder: (context, index) {
        return PrayerTile(
          name: prayerTimes[index]["name"]!,
          time: prayerTimes[index]["time"]!,
        );
      },
    );
  }
}

class PrayerTile extends StatelessWidget {
  final String name;
  final String time;

  const PrayerTile({super.key, required this.name, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.75),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            alignment: Alignment.center,
            width: double.infinity,
            height: 30,
            child: Text(
              name,
              style: AppStyle.textStyle18NotoKufia
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 10),
          Text(
            time,
            style: AppStyle.textStyle18NotoKufia.copyWith(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ],
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
