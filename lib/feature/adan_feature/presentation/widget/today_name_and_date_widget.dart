import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';
import 'package:prayer_times/core/utls/app_style.dart';

class TodayNameAndDateWidget extends StatelessWidget {
  final String todayNameDay ;// DateFormat('EEEE', 'ar').format(DateTime.now());
  final String todayDate ;//=      DateFormat(' d MMMM yyyy', 'ar').format(DateTime.now());
  final String jHijri ;//=      "${JHijri.now().day} ${JHijri.now().monthName} ${JHijri.now().year} هـ";

  const TodayNameAndDateWidget({
    super.key, required this.todayNameDay, required this.todayDate, required this.jHijri,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("اليوم: $todayNameDay", style: AppStyle.textStyle18NotoKufia),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(todayDate, style: AppStyle.textStyle18NotoKufia,),
            Text(jHijri, style: AppStyle.textStyle18NotoKufia),
          ],
        ),
      ],
    );
  }
}
