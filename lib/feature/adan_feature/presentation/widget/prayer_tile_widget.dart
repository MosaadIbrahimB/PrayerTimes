import 'package:flutter/material.dart';
import 'package:prayer_times/core/utls/app_style.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/prayer_table_widget.dart';

class PrayerTileWidget extends StatelessWidget {
  final UIPrayerTimeModel uIPrayerTimeModel;

  const PrayerTileWidget({super.key, required this.uIPrayerTimeModel});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white24, width: .5),
            color: Colors.black.withOpacity(.75),
          ),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .15,
          height: 30,
          child: Text(
            uIPrayerTimeModel.name,
            style: AppStyle.textStyle18NotoKufia.copyWith(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 11),
          ),
        ),
        Container(
          height: 30,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black38, width: .5),
            color: Colors.white,
          ),
          alignment: Alignment.center,
          // width: MediaQuery.of(context).size.width * .15,
          child: Text(
            uIPrayerTimeModel.time,
            style: AppStyle.textStyle18NotoKufia.copyWith(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
