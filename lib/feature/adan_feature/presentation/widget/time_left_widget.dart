import 'package:flutter/material.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/time_box_widget.dart';
class TimeLeftWidget extends StatelessWidget {
  const TimeLeftWidget({
    super.key,
    required this.timeLeft,
  });

  final Duration timeLeft;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeBoxWidget(value: (timeLeft.inSeconds % 60).toString().padLeft(2, '0') ),
        const Text(" : ",
            style: TextStyle(fontSize: 24, color: Colors.white)),
        TimeBoxWidget(value:(timeLeft.inMinutes % 60).toString().padLeft(2, '0')),
        const Text(" : ",
            style: TextStyle(fontSize: 24, color: Colors.white)),
        TimeBoxWidget(value:timeLeft.inHours.toString().padLeft(2, '0')),
      ],
    );
  }
}
