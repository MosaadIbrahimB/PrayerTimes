import 'dart:async';

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


class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  PrayerTimesScreenState createState() => PrayerTimesScreenState();
}

class PrayerTimesScreenState extends State<PrayerTimesScreen> {
  // String selectedCountry = "مصر";
  // String selectedCity = "القاهرة";

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
          if (state is ErrorAthanState) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is SucceedAthanState) {
            var s = state.athanModel;
            var todayNameDay = s?.data?.date?.hijri?.weekday?.ar ?? "no data";
            var todayDate = s?.data?.date?.readable ?? "no data";
            var number = s?.data?.date?.hijri?.month?.number ?? "no data";
            var ar = s?.data?.date?.hijri?.month?.ar ?? "no data";
            var year = s?.data?.date?.hijri?.year ?? "no data";
            List<String>countryName= AthanCube.get(context).nameCountryAR().isEmpty?["مصر","السعودية","الكويت"]:AthanCube.get(context).nameCountryAR();
            String cityName="مصر" ;
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                DropdownButtonFormField<String>(
                  iconDisabledColor: Colors.black87,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.white,
                  ),
                  value: AthanCube.get(context).selectedCountry,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  items:countryName.map((String country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(
                        country,
                        style: AppStyle.textStyle18NotoKufia.copyWith(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {

                  setState(() {
                    cityName=value!;

                  });
                  },
                  dropdownColor: Color(0xdd733487),
                  borderRadius: BorderRadius.circular(8),

                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  iconDisabledColor: Colors.black87,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.white,
                  ),
                  value: AthanCube.get(context).nameCityAR(cityName).first,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  items:AthanCube.get(context).nameCityAR(cityName).map((String country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(
                        country,
                        style: AppStyle.textStyle18NotoKufia.copyWith(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      AthanCube.get(context). selectedCity = value! ;
                      // AthanCube.get(context).getAthanByCountry("السعودية", value);


                    });
                  },
                  dropdownColor: Color(0xdd733487),
                  borderRadius: BorderRadius.circular(8),

                ),
                //
                // const SizedBox(height: 10),
                // Text(
                //   "${AthanCube.get(context).selectedCountry} - ${AthanCube.get(context).selectedCity}",
                //   style: AppStyle.textStyle20NotoKufia,
                // ),
                // const SizedBox(height: 15),
                // TodayNameAndDateWidget(
                //   todayNameDay: todayNameDay,
                //   todayDate: todayDate,
                //   jHijri: "$number $ar $year",
                // ),
                // const SizedBox(height: 10),
                // // // عرض الوقت الحالي
                // Center(child: TimeNowWidget()),
                // const SizedBox(height: 10),
                // // // العداد التنازلي
                // Center(
                //     child: Text(
                //       "باقي على الظهر",
                //       style: AppStyle.textStyle18NotoKufia,
                //     )),
                // const SizedBox(height: 20),
                // TimeLeftWidget(timeLeft: timeLeft),
                // const SizedBox(height: 15),
                Expanded(
                    child: PrayerTableWidget(
                  prayerTimes: state.prayerTimes!,
                ))
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
