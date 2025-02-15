import 'package:flutter/material.dart';
import 'package:prayer_times/feature/presentation/widget/prayer_tile_widget.dart';

import '../data/model/TimingsModel.dart';
class PrayerTableWidget extends StatefulWidget {

  final TimingsModel? prayerTimes ;

  PrayerTableWidget({super.key, required this.prayerTimes});

  @override
  State<PrayerTableWidget> createState() => _PrayerTableWidgetState();
}

class _PrayerTableWidgetState extends State<PrayerTableWidget> {
  List <UIPrayerTimeModel> prayerTime = [];
  @override
  void initState() {
     prayerTime = [
       UIPrayerTimeModel(name: "صلاة الفجر", time:time12(widget.prayerTimes?.fajr) ),
        UIPrayerTimeModel(name: "الشروق", time: time12(widget.prayerTimes?.sunrise)),
        UIPrayerTimeModel(name: "صلاة الظهر", time:time12(widget.prayerTimes?.dhuhr) ),
        UIPrayerTimeModel(name: "صلاة العصر", time: time12(widget.prayerTimes?.asr)),
        UIPrayerTimeModel(name: "صلاة المغرب", time:time12(widget.prayerTimes?.maghrib) ),
        UIPrayerTimeModel(name: "صلاة العشاء", time: time12(widget.prayerTimes?.isha)),
    ];
    super.initState();
  }
  time12(String? time){
    int x=int.parse(time?.substring(0,2)??'100' )%12;
    String y=time?.substring(2)??'100';

    return x.toString()+y;
  }



  @override
  Widget build(BuildContext context) {
// print(widget.prayerTimes?.asr??"aaa");
    return

      GridView.builder(

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // ثلاث أعمدة
        childAspectRatio: 1 / .6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: prayerTime.length,
      itemBuilder: (context, index) {
        return PrayerTileWidget(uIPrayerTimeModel:prayerTime[index] );
      },
    );
  }
}

class UIPrayerTimeModel {
String name;
String time;
UIPrayerTimeModel({required this.name, required this.time});

}