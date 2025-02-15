import 'package:equatable/equatable.dart';

class AthanModel extends Equatable {
    AthanModel({
        required this.code,
        required this.status,
        required this.data,
    });

    final num? code;
    final String? status;
    final DataModel? data;

    factory AthanModel.fromJson(Map<String, dynamic> json){ 
        return AthanModel(
            code: json["code"],
            status: json["status"],
            data: json["data"] == null ? null : DataModel.fromJson(json["data"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data?.toJson(),
    };

    @override
    List<Object?> get props => [
    code, status, data, ];
}

class DataModel extends Equatable {
    DataModel({
        required this.timings,
        required this.date,
        required this.meta,
    });

    final TimingsModel? timings;
    final DateModel? date;
    final MetaModelModel? meta;

    factory DataModel.fromJson(Map<String, dynamic> json){
        return DataModel(
            timings: json["timings"] == null ? null : TimingsModel.fromJson(json["timings"]),
            date: json["date"] == null ? null : DateModel.fromJson(json["date"]),
            meta: json["meta"] == null ? null : MetaModelModel.fromJson(json["meta"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "timings": timings?.toJson(),
        "date": date?.toJson(),
        "meta": meta?.toJson(),
    };

    @override
    List<Object?> get props => [
    timings, date, meta, ];
}

class DateModel extends Equatable {
    DateModel({
        required this.readable,
        required this.timestamp,
        required this.hijri,
        required this.gregorian,
    });

    final String? readable;
    final String? timestamp;
    final HijriModel? hijri;
    final GregorianModel? gregorian;

    factory DateModel.fromJson(Map<String, dynamic> json){
        return DateModel(
            readable: json["readable"],
            timestamp: json["timestamp"],
            hijri: json["hijri"] == null ? null : HijriModel.fromJson(json["hijri"]),
            gregorian: json["gregorian"] == null ? null : GregorianModel.fromJson(json["gregorian"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "readable": readable,
        "timestamp": timestamp,
        "hijri": hijri?.toJson(),
        "gregorian": gregorian?.toJson(),
    };

    @override
    List<Object?> get props => [
    readable, timestamp, hijri, gregorian, ];
}

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

class MetaModelModel extends Equatable {
    MetaModelModel({
        required this.latitude,
        required this.longitude,
        required this.timezone,
        required this.method,
    });

    final num? latitude;
    final num? longitude;
    final String? timezone;
    final MethodModel? method;

    factory MetaModelModel.fromJson(Map<String, dynamic> json){
        return MetaModelModel(
            latitude: json["latitude"],
            longitude: json["longitude"],
            timezone: json["timezone"],
            method: json["method"] == null ? null : MethodModel.fromJson(json["method"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "timezone": timezone,
        "method": method?.toJson(),
    };

    @override
    List<Object?> get props => [
    latitude, longitude, timezone, method, ];
}

class MethodModel extends Equatable {
    MethodModel({
        required this.id,
        required this.name,
        required this.params,
        required this.location,
    });

    final int? id;
    final String? name;
    final ParamsModel? params;
    final LocationModel? location;

    factory MethodModel.fromJson(Map<String, dynamic> json){
        return MethodModel(
            id: json["id"],
            name: json["name"],
            params: json["params"] == null ? null : ParamsModel.fromJson(json["params"]),
            location: json["location"] == null ? null : LocationModel.fromJson(json["location"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "params": params?.toJson(),
        "location": location?.toJson(),
    };

    @override
    List<Object?> get props => [
    id, name, params, location, ];
}

class LocationModel extends Equatable {
    LocationModel({
        required this.latitude,
        required this.longitude,
    });

    final num? latitude;
    final num? longitude;

    factory LocationModel.fromJson(Map<String, dynamic> json){
        return LocationModel(
            latitude: json["latitude"],
            longitude: json["longitude"],
        );
    }

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };

    @override
    List<Object?> get props => [
    latitude, longitude, ];
}

class ParamsModel extends Equatable {
    ParamsModel({
        required this.fajr,
        required this.isha,
    });

    final num? fajr;
    final num? isha;

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
