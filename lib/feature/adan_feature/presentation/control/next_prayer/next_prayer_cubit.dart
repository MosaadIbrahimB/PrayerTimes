import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/timing_modle.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/country/country_cubit.dart';

import '../../../domain/model/next_prayer_model.dart';
import 'next_prayer_state.dart';

class NextPrayerCubit extends Cubit<NextPrayerState> {
  final CountryCubit countryCubit;
  Timer? _timer;

  NextPrayerCubit({required this.countryCubit})
      : super(NextPrayerInitialState()) {
    getNextPrayerTime(); // استدعاء أولي عند الإنشاء
    startTimer(); // بدء التحديث التلقائي
  }

  void startTimer() {
    _timer?.cancel(); // إلغاء أي مؤقت قديم
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      getNextPrayerTime(); // تحديث الوقت كل دقيقة
    });
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

      if (nextPrayer == null) {
        nextPrayer = prayerTimes.keys.first.add(Duration(days: 1));
        nextPrayerName = prayerTimes.values.first;
      }

      Duration remainingTime = nextPrayer.difference(now);
      String time = "  ${remainingTime.inMinutes % 60} : ${remainingTime.inHours}";

      emit(NextPrayerSucceedState(
        nextPrayerModel: NextPrayerModel(
          nextPrayer: nextPrayerName.toString(),
          remainingTimePrayer: replaceNumbersWithArabic(time),
        ),
      ));
    } catch (e) {
      log(e.toString());
    }
  }

  String replaceNumbersWithArabic(String input) {
    const Map<String, String> numbersMap = {
      "0": "٠", "1": "١", "2": "٢", "3": "٣", "4": "٤",
      "5": "٥", "6": "٦", "7": "٧", "8": "٨", "9": "٩"
    };
    return input.split('').map((char) => numbersMap[char] ?? char).join();
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // إيقاف المؤقت عند التخلص من Cubit
    return super.close();
  }
}
