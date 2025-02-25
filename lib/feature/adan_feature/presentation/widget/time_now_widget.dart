import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/core/utls/app_style.dart';
import '../control/time/time_cubit.dart';

class TimeNowWidget extends StatelessWidget {
  const TimeNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<TimeCubit, String>(
        builder: (context, time) {
          return Text(
            "الساعة الآن ${replaceNumbersWithArabic(time)}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!,
          );
        },

    );
  }

  String replaceNumbersWithArabic(String input) {
    const Map<String, String> numbersMap = {
      "0": "٠",
      "1": "١",
      "2": "٢",
      "3": "٣",
      "4": "٤",
      "5": "٥",
      "6": "٦",
      "7": "٧",
      "8": "٨",
      "9": "٩"
    };

    return input.split('').map((char) => numbersMap[char] ?? char).join();
  }
}

// class TimeNowWidget extends StatelessWidget {
//   const TimeNowWidget({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//
//
//     return StreamBuilder(
//       stream: Stream.periodic(const Duration(minutes: 1)),
//       builder: (context, snapshot) {
//         return Text(
//           textAlign: TextAlign.center,
//           "الساعة الآن ${replaceNumbersWithArabic(DateFormat('hh:mm a', 'ar').format(DateTime.now()))} ",
//        style: AppStyle.textStyle18NotoKufia,
//         );
//       },
//     );
//   }
//
//
//
//   String replaceNumbersWithArabic(String input) {
//     const Map<String, String> numbersMap = {
//       "0": "٠",
//       "1": "١",
//       "2": "٢",
//       "3": "٣",
//       "4": "٤",
//       "5": "٥",
//       "6": "٦",
//       "7": "٧",
//       "8": "٨",
//       "9": "٩"
//     };
//
//     return input.split('').map((char) => numbersMap[char] ?? char).join();
//   }
// }
