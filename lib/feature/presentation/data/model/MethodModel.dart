import 'package:equatable/equatable.dart';

import 'LocationModel.dart';
import 'ParamsModel.dart';

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
