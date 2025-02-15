import 'package:equatable/equatable.dart';

import 'GregorianModel.dart';
import 'HijriModel.dart';

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
