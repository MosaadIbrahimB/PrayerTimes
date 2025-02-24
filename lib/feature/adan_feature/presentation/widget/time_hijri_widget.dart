import 'package:flutter/material.dart';
import 'package:prayer_times/core/utls/app_style.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/hijri_model.dart';

class TimeHijriWidget extends StatelessWidget {
  final HijriModel hijriModel;

  const TimeHijriWidget({super.key, required this.hijriModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          hijriModel.numberDay ?? '',
          style: AppStyle.textStyle18NotoKufia,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          hijriModel.month ?? "",
          style: AppStyle.textStyle18NotoKufia,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          hijriModel.year ?? "",
          style: AppStyle.textStyle18NotoKufia,
        ),
      ],
    );
  }
}
