import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/core/utls/app_style.dart';
import 'package:prayer_times/feature/presentation/control/athan_cubit.dart';
import 'package:prayer_times/feature/presentation/control/athan_state.dart';
import 'package:prayer_times/feature/presentation/widget/c_dropdown_button_form_field_widget.dart';
import 'package:prayer_times/feature/presentation/widget/prayer_table_widget.dart';
import 'package:prayer_times/feature/presentation/widget/time_left_widget.dart';
import 'package:prayer_times/feature/presentation/widget/time_now_widget.dart';
import 'package:prayer_times/feature/presentation/widget/today_name_and_date_widget.dart';

import '../data/model/TimingsModel.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  PrayerTimesScreenState createState() => PrayerTimesScreenState();
}

class PrayerTimesScreenState extends State<PrayerTimesScreen> {
  String selectedCountry = "مصر";
  String selectedCity = "القاهرة";

  Duration timeLeft = const Duration(hours: 1, minutes: 33, seconds: 59);

  @override
  void initState() {
    super.initState();
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   if (mounted) {
    //     setState(() {
    //       if (timeLeft.inSeconds > 0) {
    //         timeLeft = timeLeft - const Duration(seconds: 1);
    //       }
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<AthanCube, AthanState>(
        builder: (context, state) {

          if(state is ErrorAthanState){
            return Center(child: Text(state.message),);
          }
          if(state is SucceedAthanState){
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CDropdownButtonFormFieldWidget(
                    value: selectedCountry,
                    list: ["مصر", "السعودية", "الإمارات"]),
                const SizedBox(height: 10),
                CDropdownButtonFormFieldWidget(
                    value: selectedCity,
                    list: ["القاهرة", "الإسكندرية", "الرياض", "دبي"]),
                const SizedBox(height: 10),
                Text(
                  "$selectedCountry - $selectedCity",
                  style: AppStyle.textStyle20NotoKufia,
                ),
                const SizedBox(height: 15),
                TodayNameAndDateWidget(),
                const SizedBox(height: 10),
                // عرض الوقت الحالي
                TimeNowWidget(),
                const SizedBox(height: 10),
                // العداد التنازلي
                Align(
                    alignment: Alignment.center,
                    child: Text(
                      "باقي على الظهر",
                      style: AppStyle.textStyle18NotoKufia,
                    )),
                const SizedBox(height: 20),
                TimeLeftWidget(timeLeft: timeLeft),
                const SizedBox(height: 15),

                Expanded(child: PrayerTableWidget(prayerTimes: state.prayerTimes!,))
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }


}


// زر التفعيل
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     const Text(
//       "تفعيل خدمة إشعارات مواقيت الصلاة",
//       style: TextStyle(fontSize: 16, color: Colors.white),
//     ),
//     Switch(
//       value: true,
//       onChanged: (val) {},
//     ),
//   ],
// ),
