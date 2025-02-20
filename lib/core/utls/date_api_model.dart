
class Country {
  final String nameEn;
  final String nameAr;
  final List<City> cities;

  Country({required this.nameEn, required this.nameAr, required this.cities});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      nameEn: json['name_country_en'] as String,
      nameAr: json['name_country_ar'] as String,
      cities: (json['name_city'] as List)
          .map((city) => City.fromJson(city))
          .toList(),
    );
  }
}

class City {
  final String ?nameEn;
  final String ?nameAr;
  final double ?lat;
  final double ?lon;

  City({ this.nameEn,  this.nameAr,  this.lat,  this.lon});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      nameEn: json['name_en'] as String,
      nameAr: json['name_ar'] as String,
      lat: double.parse(json['lat']), // تحويل إلى double
      lon: double.parse(json['lon']), // تحويل إلى double
    );
  }
}
