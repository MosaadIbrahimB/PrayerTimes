class HijriModel {
  String numberDay;
  String nameDay;
  String month;
  String year;

  HijriModel(
      this.numberDay,
      this.nameDay,
      this.month,
      this.year,
      );

  HijriModel.fromJson(Map<String, dynamic> json)
      : this(
    json['day'],
    json['weekday']['ar'],
    json['month']['ar'],
    json['year'],
  );
}
