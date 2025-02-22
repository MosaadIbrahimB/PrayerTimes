import 'package:flutter/material.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/timing_modle.dart';
class TimePrayerWidget extends StatelessWidget {
  final TimingModel timePrayer;
  const TimePrayerWidget({super.key, required this.timePrayer});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("صلاة العشاء"),
            Text(timePrayer.isha),
          ],
        ),
        Column(
          children: [
            Text("صلاة المغرب"),
            Text(timePrayer.maghrib),
          ],
        ),
        Column(
          children: [
            Text("صلاة العصر"),
            Text(timePrayer.asr),
          ],
        ),
        Column(
          children: [
            Text("صلاة الظهر"),
            Text(timePrayer.dhuhr),
          ],
        ),
        Column(
          children: [
            Text("الشروق"),
            Text(timePrayer.sunrise),
          ],
        ),
        Column(
          children: [
            Text("صلاة الفجر"),
            Text(timePrayer.fajr),
          ],
        ),
      ],
    ) ;

  }
}
