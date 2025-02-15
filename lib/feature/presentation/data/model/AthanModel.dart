import 'package:equatable/equatable.dart';
import 'DataModel.dart';

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
