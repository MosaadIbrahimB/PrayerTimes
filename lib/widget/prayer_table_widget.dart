import 'package:flutter/material.dart';
import 'package:prayer_times/widget/prayer_tile_widget.dart';
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
        return PrayerTileWidget(
          name: prayerTimes[index]["name"]!,
          time: prayerTimes[index]["time"]!,
        );
      },
    );
  }
}
