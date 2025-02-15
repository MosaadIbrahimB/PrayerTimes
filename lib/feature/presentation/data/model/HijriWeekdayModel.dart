import 'package:equatable/equatable.dart';

class HijriWeekdayModel extends Equatable {
    HijriWeekdayModel({
        required this.en,
        required this.ar,
    });

    final String? en;
    final String? ar;

    factory HijriWeekdayModel.fromJson(Map<String, dynamic> json){
        return HijriWeekdayModel(
            en: json["en"],
            ar: json["ar"],
        );
    }

    Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
    };

    @override
    List<Object?> get props => [
    en, ar, ];
}
