import 'city_model.dart';

class CountryModel {
  final String nameAr;
  final String nameEn;
  final List<CityModel> cities;

  CountryModel({
    required this.nameAr,
    required this.nameEn,
    required this.cities,
  });

  /// دالة ترجع أسماء المدن بالعربية أو الإنجليزية حسب الحاجة
  List<String> getCities({bool inEnglish = false}) {
    return inEnglish
        ? cities.map((city) => city.nameEn).toList()
        : cities.map((city) => city.nameAr).toList();
  }
}
