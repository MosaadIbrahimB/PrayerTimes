import 'package:equatable/equatable.dart';

import 'HijriWeekdayModel.dart';
import 'MonthModel.dart';

class HijriModel extends Equatable {
    HijriModel({
        required this.date,
        required this.format,
        required this.day,
        required this.weekday,
        required this.month,
        required this.year,
    });

    final String? date;
    final String? format;
    final String? day;
    final HijriWeekdayModel? weekday;
    final MonthModel? month;
    final String? year;

    factory HijriModel.fromJson(Map<String, dynamic> json){
        return HijriModel(
            date: json["date"],
            format: json["format"],
            day: json["day"],
            weekday: json["weekday"] == null ? null : HijriWeekdayModel.fromJson(json["weekday"]),
            month: json["month"] == null ? null : MonthModel.fromJson(json["month"]),
            year: json["year"],
        );
    }

    Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday?.toJson(),
        "month": month?.toJson(),
        "year": year,
    };

    @override
    List<Object?> get props => [
    date, format, day, weekday, month, year, ];
}
