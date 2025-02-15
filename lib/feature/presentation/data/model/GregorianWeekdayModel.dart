import 'package:equatable/equatable.dart';

class GregorianWeekdayModel extends Equatable {
    GregorianWeekdayModel({
        required this.en,
    });

    final String? en;

    factory GregorianWeekdayModel.fromJson(Map<String, dynamic> json){
        return GregorianWeekdayModel(
            en: json["en"],
        );
    }

    Map<String, dynamic> toJson() => {
        "en": en,
    };

    @override
    List<Object?> get props => [
    en, ];
}
