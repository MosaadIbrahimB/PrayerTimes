import 'package:prayer_times/feature/adan_feature/domain/model/city_model.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/country_model.dart';


class AViewModel{

 static  List<CountryModel> countriesList = [
    CountryModel(
      nameAr: "مصر",
      nameEn: "EG",
      cities: [
        CityModel(
            nameAr: "القاهرة",
            nameEn: "cairo",
            latitude: "30.033333",
            longitude: "31.233334"),
        CityModel(
            nameAr: "المنصورة",
            nameEn: "mansoura",
            latitude: "31.03637",
            longitude: "31.38069"),
        CityModel(
            nameAr: "اسكندرية",
            nameEn: "alexandria",
            latitude: "31.200092",
            longitude: "29.918739"),
      ],
    ),
    CountryModel(
      nameAr: "السعودية",
      nameEn: "SA",
      cities: [
        CityModel(
            nameAr: "الرياض",
            nameEn: "riyadh",
            latitude: "24.633333",
            longitude: "46.716667"),
        CityModel(
            nameAr: "جدة",
            nameEn: "jeddah",
            latitude: "21.51694",
            longitude: "39.21917"),
        CityModel(
            nameAr: "مكة",
            nameEn: "makkah",
            latitude: "21.3891",
            longitude: "39.8579"),
      ],
    ),
  ];




}