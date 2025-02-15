import 'package:equatable/equatable.dart';

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
