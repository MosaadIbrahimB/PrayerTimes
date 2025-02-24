import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/timing_modle.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/adan/adan_state.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/country/country_cubit.dart';

class AdanCubit extends Cubit<AdanState> {
  CountryCubit countryCubit;

  AdanCubit(this.countryCubit) : super(AdanInitialState());

  static AdanCubit get(BuildContext context) => BlocProvider.of(context);
String _nextPrayer='';
String _remainingTimePrayer='';


setNextPrayer(String nextPrayer){
  _nextPrayer=nextPrayer;
}
String getNextPrayer()=>_nextPrayer;
  setRemainingTimePrayer(String remainingTimePrayer){
    _remainingTimePrayer=remainingTimePrayer;
  }
  String getRemainingTimePrayer()=>_remainingTimePrayer;
  getTimePrayer() async {
    TimingModel timingModel = await countryCubit.getTimePrayer();
    timingModel = getTime(timingModel);
    getNextPrayerTime().then((value) =>
    emit(AdanSucceedState(timingModel: timingModel)));
  }

  Future<void> getNextPrayerTime() async {
    DateTime now = DateTime.now();
    DateTime? nextPrayer;
    String? nextPrayerName;
    try {
      TimingModel timingModel = await countryCubit.getTimePrayer();
      Map<DateTime, String> prayerTimes = timingModel.getPrayerTimes();
      for (var entry in prayerTimes.entries) {
        if (entry.key.isAfter(now)) {
          nextPrayer = entry.key;
          nextPrayerName = entry.value;
          break;
        }
      }
      // في حالة انتهاء جميع الصلوات، تحديد الفجر لليوم التالي
      if (nextPrayer == null) {
        nextPrayer = prayerTimes.keys.first.add(Duration(days: 1));
        nextPrayerName = prayerTimes.values.first;
      }

      // حساب المدة المتبقية
      Duration remainingTime = nextPrayer.difference(now);
      setNextPrayer(nextPrayerName.toString());
      String time="  ${remainingTime.inMinutes % 60} : ${remainingTime.inHours}";
      setRemainingTimePrayer(replaceNumbersWithArabic(time));
      print("$time  ");
      // print("الوقت المتبقي: ${remainingTime.inHours} ساعة و ${remainingTime.inMinutes % 60} دقيقة");
    } catch (e) {
      print(e);
    }
  }

  TimingModel getTime(TimingModel timing) {
    return TimingModel(
        fajr: getTime12Hour(timing.fajr),
        sunrise: getTime12Hour(timing.sunrise),
        dhuhr: getTime12Hour(timing.dhuhr),
        asr: getTime12Hour(timing.asr),
        maghrib: getTime12Hour(timing.maghrib),
        isha: getTime12Hour(timing.isha));
  }

  getTime12Hour(String time) {
    String formattedTime = DateFormat("hh:mm a", "ar")
        .format(DateFormat("hh:mm", "ar").parse(time))
        .toString();

    return replaceNumbersWithArabic(formattedTime);
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






