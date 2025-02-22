import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeEnWidget extends StatelessWidget {
  const TimeEnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(DateFormat('y').format(DateTime.now())),
        const SizedBox(
          width: 10,
        ),
        Text(DateFormat('MMMM', 'ar').format(DateTime.now())),
        const SizedBox(
          width: 10,
        ),
        Text(DateFormat('d').format(DateTime.now())),
      ],
    );

  }
}
