import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/core/utls/api_service.dart';
import 'package:prayer_times/core/utls/date_api_model.dart';
import 'package:prayer_times/feature/presentation/control/athan_state.dart';
import 'package:prayer_times/feature/presentation/data/model/AthanModel.dart';

import '../data/model/TimingsModel.dart';

class AthanCube extends Cubit<AthanState> {
  AthanCube() : super(InitialAthanState());
  static AthanCube get(context) => BlocProvider.of<AthanCube>(context);

  String selectedCountry = "مصر";
  String selectedCity = "القاهرة";

  List<CountryModel> countries = [
    CountryModel(
        nameEn:  "EG",
        nameAr:  "مصر" ,
        cities: [
      CityModel(nameEn: "cairo", nameAr: "القاهرة", lat: 30.033333, lon: 31.233334),
      CityModel(nameEn: "alexandria", nameAr: "الإسكندرية", lat: 31.200092, lon: 29.918739),
      CityModel(nameEn: "giza", nameAr: "الجيزة", lat: 30.013056, lon: 31.208853),
    ]),
    CountryModel(nameAr:  "السعودية",
        nameEn:  "SA",
        cities: [
      CityModel(nameEn: "riyadh", nameAr: "الرياض", lat: 24.7136, lon: 46.6753),
      CityModel(nameEn: "jeddah", nameAr: "جدة", lat: 21.2854, lon: 39.2376),
    ]),
  ];
List<String>nameCountryAR(){
  // emit(SelectCountryState());
  // getAthan();
  return countries.map((e) => e.nameAr!).toList() ;
}
  List<String>nameCityAR(String countryAR){

    return countries.firstWhere((element) => element.nameAr==countryAR).cities!.map((e) => e.nameAr!).toList();

  }


  void getAthan() async {
    emit(LoadingAthanState());
    try {
      ApiService apiService = ApiService(Dio());
      apiService.getByCountryAndCity("EG", "Cairo").then(
            (value) {
          AthanModel athanModel = AthanModel.fromJson(value);

          TimingsModel? timings = athanModel.data!.timings;

          emit(SucceedAthanState(athanModel: athanModel, prayerTimes: timings));
        },
      );
    } catch (e) {
      emit(ErrorAthanState(message: e.toString()));
    }
  }

  void getAthanByCountry(String countryAr, String cityAR) async {
   List<String> nameCountryAndCityEnglish = searchCountryAndCity(
        countryAr, cityAR, []) ??["EG",  "cairo"];
    emit(LoadingAthanState());
    try {
      ApiService apiService = ApiService(Dio());
      apiService.getByCountryAndCity(nameCountryAndCityEnglish[0], nameCountryAndCityEnglish[1]).then(
            (value) {
          AthanModel athanModel = AthanModel.fromJson(value);

          TimingsModel? timings = athanModel.data!.timings;

          emit(SucceedAthanState(athanModel: athanModel, prayerTimes: timings));
        },
      );
    } catch (e) {
      emit(ErrorAthanState(message: e.toString()));
    }
  }

  List<String>? searchCountryAndCity(String countryAr, String cityAr,
      List<Map<String, dynamic>> countries) {
    for (var country in countries) {
      if (country["name_ar"] == countryAr) {
        for (var city in country["cities"]) {
          if (city["name_ar"] == cityAr) {
            return
              [
                country["name_en"], city["name_en"],
              ];
          }
        }
      }
    }
    return null; // في حال لم يتم العثور على الدولة أو المدينة
  }


}

class CountryModel{
  String? nameEn;
  String? nameAr;
  List<CityModel>? cities;
  CountryModel({ this.nameEn,  this.nameAr,  this.cities});

}
class CityModel{
  String ?nameEn;
  String? nameAr;
  double ?lat;
  double ?lon;
  CityModel({ this.nameEn,  this.nameAr,  this.lat, required this.lon});
}



// List<Map<String, dynamic>> countries = [
//   {
//     "name_ar": "مصر",
//     "name_en": "EG",
//     "cities": [
//       {"name_ar": "القاهرة", "name_en": "cairo"},
//       {"name_ar": "الإسكندرية", "name_en": "alexandria"},
//       {"name_ar": "الجيزة", "name_en": "giza"},
//
//     ],
//   },
//   {
//     "name_ar": "السعودية",
//     "name_en": "SA",
//     "cities": [
//       {"name_ar": "الرياض", "name_en": "riyadh"},
//       {"name_ar": "جدة", "name_en": "jeddah"},
//
//     ],
//   }
// ];
