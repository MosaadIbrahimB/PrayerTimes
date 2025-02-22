import 'hijri_model.dart';

class DateDayModel {
  String readable;
  HijriModel hijri;

  DateDayModel(this.readable, this.hijri);

  DateDayModel.fromJson(Map<String, dynamic> json)
      : this(
    json['readable'],
    HijriModel.fromJson(json['hijri']),
  );
}
