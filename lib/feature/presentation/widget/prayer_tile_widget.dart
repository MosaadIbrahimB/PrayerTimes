import 'package:flutter/material.dart';
import 'package:prayer_times/core/utls/app_style.dart';
import 'package:prayer_times/feature/presentation/widget/prayer_table_widget.dart';
class PrayerTileWidget extends StatelessWidget {
final  UIPrayerTimeModel uIPrayerTimeModel ;

  const PrayerTileWidget({super.key,required this.uIPrayerTimeModel});

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
              uIPrayerTimeModel.name,
              style: AppStyle.textStyle18NotoKufia
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 10),
          Text(
            uIPrayerTimeModel. time,
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
