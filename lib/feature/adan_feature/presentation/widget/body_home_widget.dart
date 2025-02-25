import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/country_and_city_widget.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/prayer_body_widget.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/time_now_widget.dart';
import 'hijri_body_widget.dart';
import 'next_prayer_widget.dart';

class BodyHomeWidget extends StatelessWidget {
  const BodyHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CountryAndCityWidget(),
        SizedBox(height: 12.h),
        TimeNowWidget(),
        SizedBox(height: 10.h),
        HijriBodyWidget(),
        const SizedBox(height: 10),
        NextPrayerWidget(),
        SizedBox(height: 10.h),
        PrayerBodyWidget(),
        const SizedBox(height: 10),
      ],
    );
  }
}
