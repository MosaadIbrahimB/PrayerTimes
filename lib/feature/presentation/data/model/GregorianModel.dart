import 'package:equatable/equatable.dart';

import 'GregorianWeekdayModel.dart';

class GregorianModel extends Equatable {
    GregorianModel({
        required this.date,
        required this.format,
        required this.day,
        required this.weekday,
    });

    final String? date;
    final String? format;
    final String? day;
    final GregorianWeekdayModel? weekday;

    factory GregorianModel.fromJson(Map<String, dynamic> json){
        return GregorianModel(
            date: json["date"],
            format: json["format"],
            day: json["day"],
            weekday: json["weekday"] == null ? null : GregorianWeekdayModel.fromJson(json["weekday"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "date": date,
        "format": format,
        "day": day,
        "weekday": weekday?.toJson(),
    };

    @override
    List<Object?> get props => [
    date, format, day, weekday, ];
}
