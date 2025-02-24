import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prayer_times/core/utls/app_style.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/prayer_item_widget.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/time_prayer_widget.dart';

import '../control/adan/adan_cubit.dart';
import '../control/adan/adan_state.dart';
import 'next_prayer_widget.dart';

class PrayerBodyWidget extends StatelessWidget {
  const PrayerBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdanCubit, AdanState>(builder: (context, state) {
      if (state is AdanSucceedState) {

        return SizedBox(
          width: MediaQuery.of(context).size.width * .98,
          child: Row(
            children: [
              PrayerItemWidget(
                timingModel: state.timingModel.fajr,
                name: "الفجر",
              ),
              PrayerItemWidget(
                timingModel: state.timingModel.sunrise,
                name: "الشروق",
              ),
              PrayerItemWidget(
                timingModel: state.timingModel.dhuhr,
                name: "الظهر",
              ),
              PrayerItemWidget(
                timingModel: state.timingModel.asr,
                name: "العصر",
              ),
              PrayerItemWidget(
                timingModel: state.timingModel.maghrib,
                name: "المغرب",
              ),
              PrayerItemWidget(
                timingModel: state.timingModel.isha,
                name: "العشاء",
              ),
            ],
          ),
        );
        return TimePrayerWidget(timePrayer: state.timingModel);
      }
      return Container(
        child: Text(
          "يتم تحميل مواعيد الصلاة ... ",
          style: AppStyle.textStyle18NotoKufia,
        ),
      );
    });
  }
}


