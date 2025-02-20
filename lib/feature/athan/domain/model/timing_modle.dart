import 'package:intl/intl.dart';

class TimingModel {
  String fajr;
  String sunrise;
  String dhuhr;
  String asr;
  String maghrib;
  String isha;

  TimingModel(
      this.fajr, this.sunrise, this.dhuhr, this.asr, this.maghrib, this.isha);

  TimingModel.fromJson(Map<String, dynamic> json)
      : this(
    json['Fajr'],
    json['Sunrise'],
    json['Dhuhr'],
    json['Asr'],
    json['Maghrib'],
    json['Isha'],
  );

  Map<DateTime, String> getPrayerTimes() {
    DateTime now = DateTime.now();
    DateFormat format = DateFormat("HH:mm");

    return {
      format
          .parse(fajr)
          .copyWith(year: now.year, month: now.month, day: now.day): "الفجر",
      format
          .parse(dhuhr)
          .copyWith(year: now.year, month: now.month, day: now.day): "الظهر",
      format
          .parse(asr)
          .copyWith(year: now.year, month: now.month, day: now.day): "العصر",
      format
          .parse(maghrib)
          .copyWith(year: now.year, month: now.month, day: now.day): "المغرب",
      format
          .parse(isha)
          .copyWith(year: now.year, month: now.month, day: now.day): "العشاء",
    };
  }
}
