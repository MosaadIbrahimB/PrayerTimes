import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          "الساعة الآن ${DateFormat('hh:mm:ss a', 'ar').format(DateTime.now())} ",
          style: const TextStyle(fontSize: 18, color: Colors.white),
        );
      },
    );
  }
}
