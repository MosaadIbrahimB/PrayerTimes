import 'package:equatable/equatable.dart';

class TimingsModel extends Equatable {
    TimingsModel({
        required this.fajr,
        required this.sunrise,
        required this.dhuhr,
        required this.asr,
        required this.sunset,
        required this.maghrib,
        required this.isha,
        required this.imsak,
        required this.midnight,
        required this.firstthird,
        required this.lastthird,
    });

    final String? fajr;
    final String? sunrise;
    final String? dhuhr;
    final String? asr;
    final String? sunset;
    final String? maghrib;
    final String? isha;
    final String? imsak;
    final String? midnight;
    final String? firstthird;
    final String? lastthird;

    factory TimingsModel.fromJson(Map<String, dynamic> json){
        return TimingsModel(
            fajr: json["Fajr"],
            sunrise: json["Sunrise"],
            dhuhr: json["Dhuhr"],
            asr: json["Asr"],
            sunset: json["Sunset"],
            maghrib: json["Maghrib"],
            isha: json["Isha"],
            imsak: json["Imsak"],
            midnight: json["Midnight"],
            firstthird: json["Firstthird"],
            lastthird: json["Lastthird"],
        );
    }

    Map<String, dynamic> toJson() => {
        "Fajr": fajr,
        "Sunrise": sunrise,
        "Dhuhr": dhuhr,
        "Asr": asr,
        "Sunset": sunset,
        "Maghrib": maghrib,
        "Isha": isha,
        "Imsak": imsak,
        "Midnight": midnight,
        "Firstthird": firstthird,
        "Lastthird": lastthird,
    };

    @override
    List<Object?> get props => [
    fajr, sunrise, dhuhr, asr, sunset, maghrib, isha, imsak, midnight, firstthird, lastthird, ];
}
