import 'package:equatable/equatable.dart';

class ParamsModel extends Equatable {
    ParamsModel({
        required this.fajr,
        required this.isha,
    });

    final num? fajr;
    final String? isha;

    factory ParamsModel.fromJson(Map<String, dynamic> json){
        return ParamsModel(
            fajr: json["Fajr"],
            isha: json["Isha"],
        );
    }

    Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Isha": isha,
    };

    @override
    List<Object?> get props => [
    fajr, isha, ];
}
