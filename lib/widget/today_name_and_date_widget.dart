import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:prayer_times/utls/app_style.dart';
class TodayNameAndDateWidget extends StatelessWidget {
  final String todayNameDay = DateFormat('EEEE', 'ar').format(DateTime.now());
  final String todayDate =
  DateFormat(' d MMMM yyyy', 'ar').format(DateTime.now());
  final String jHijri =
      "${JHijri.now().day} ${JHijri.now().monthName} ${JHijri.now().year} هـ";

  TodayNameAndDateWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("اليوم: $todayNameDay", style: AppStyle.textStyle18NotoKufia),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(todayDate, style: AppStyle.textStyle18NotoKufia),
              Text(jHijri, style: AppStyle.textStyle18NotoKufia),
            ],
          ),
        ],
      ),
    );
  }
}
