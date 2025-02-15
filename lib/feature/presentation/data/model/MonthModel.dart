import 'package:equatable/equatable.dart';

class MonthModel extends Equatable {
    MonthModel({
        required this.number,
        required this.en,
        required this.ar,
        required this.days,
    });

    final num? number;
    final String? en;
    final String? ar;
    final num? days;

    factory MonthModel.fromJson(Map<String, dynamic> json){
        return MonthModel(
            number: json["number"],
            en: json["en"],
            ar: json["ar"],
            days: json["days"],
        );
    }

    Map<String, dynamic> toJson() => {
        "number": number,
        "en": en,
        "ar": ar,
        "days": days,
    };

    @override
    List<Object?> get props => [
    number, en, ar, days, ];
}
