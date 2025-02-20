class CityModel {
  final String nameAr;
  final String nameEn;
  final String? latitude;
  final String? longitude;

  CityModel({
    this.latitude,
    this.longitude,
    required this.nameAr,
    required this.nameEn,
  });
}
