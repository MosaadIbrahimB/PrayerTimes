
import 'package:equatable/equatable.dart';

import 'DateModel.dart';
import 'MetaModelModel.dart';
import 'TimingsModel.dart';

class DataModel extends Equatable {
    DataModel({
        required this.timings,
        required this.date,
        required this.meta,
    });

    final TimingsModel? timings;
    final DateModel? date;
    final MetaModel? meta;

    factory DataModel.fromJson(Map<String, dynamic> json){
        return DataModel(
            timings: json["timings"] == null ? null : TimingsModel.fromJson(json["timings"]),
            date: json["date"] == null ? null : DateModel.fromJson(json["date"]),
            meta: json["meta"] == null ? null : MetaModel.fromJson(json["meta"]),
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
