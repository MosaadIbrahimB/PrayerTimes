import 'package:equatable/equatable.dart';

import 'MethodModel.dart';

class MetaModel extends Equatable {
    MetaModel({
        required this.latitude,
        required this.longitude,
        required this.timezone,
        required this.method,
    });

    final num? latitude;
    final num? longitude;
    final String? timezone;
    final MethodModel? method;

    factory MetaModel.fromJson(Map<String, dynamic> json){
        return MetaModel(
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
