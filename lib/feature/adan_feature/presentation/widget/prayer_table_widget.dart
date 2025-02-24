import 'package:flutter/material.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/timing_modle.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/prayer_tile_widget.dart';



class PrayerTableWidget extends StatelessWidget {
  final TimingModel prayerTimes;
  const PrayerTableWidget({super.key, required this.prayerTimes});
 List<UIPrayerTimeModel> timingModelToListUI(){
    var w=prayerTimes;
    return  [
      UIPrayerTimeModel(
          name: "صلاة الفجر", time: w.fajr),
      UIPrayerTimeModel(
          name: "الشروق", time: w.sunrise),
      UIPrayerTimeModel(
          name: "صلاة الظهر", time: w.dhuhr),
      UIPrayerTimeModel(
          name: "صلاة العصر", time: w.asr),
      UIPrayerTimeModel(
          name: "صلاة المغرب", time: w.maghrib),
      UIPrayerTimeModel(
          name: "صلاة العشاء", time: w.isha),
    ];
  }

  @override
  Widget build(BuildContext context) {
   return Row(
     children: timingModelToListUI().map((e) => PrayerTileWidget(uIPrayerTimeModel: e),).toList(),
   );
    return ListView.builder(
scrollDirection: Axis.horizontal,
      itemCount: timingModelToListUI().length,
      itemBuilder: (context, index) {
        return PrayerTileWidget(uIPrayerTimeModel: timingModelToListUI()[index]);
      },
    );
  }
}

class UIPrayerTimeModel {
  String name;
  String time;

  UIPrayerTimeModel({required this.name, required this.time});
}
/*
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / .6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
 */