import 'package:flutter/material.dart';
import 'package:prayer_times/utls/app_style.dart';
class PrayerTileWidget extends StatelessWidget {
  final String name;
  final String time;

  const PrayerTileWidget({super.key, required this.name, required this.time});

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
