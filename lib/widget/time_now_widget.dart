import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times/utls/app_style.dart';
class TimeNowWidget extends StatelessWidget {
  const TimeNowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(hours: 1)),
      builder: (context, snapshot) {
        return Text(
          textAlign: TextAlign.center,
          "الساعة الآن ${DateFormat('hh:mm:ss a', 'ar').format(DateTime.now())} ",
       style: AppStyle.textStyle18NotoKufia,
        );
      },
    );
  }
}
