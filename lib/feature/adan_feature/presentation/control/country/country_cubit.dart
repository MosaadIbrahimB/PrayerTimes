import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/app_api_service.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/country_model.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/date_day_model.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/hijri_model.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/timing_modle.dart' show TimingModel;
import 'package:prayer_times/feature/adan_feature/presentation/screen/a_view_model.dart';

import 'country_state.dart';


class CountryCubit extends Cubit<CountryState> {
  String _selectedValue1 = 'مصر'; // القيمة الافتراضية للقائمة الأولى
  String _cityAr = 'القاهرة'; // القيمة الافتراضية للقائمة الثانية
  List<CountryModel> countriesList = AViewModel.countriesList;

  CountryCubit() : super(CountryInitialState()){
    setSelectCountry(country:  _selectedValue1);
    setCity(cityAr: _cityAr);
    getResponse();
  }

  static CountryCubit get(BuildContext context) => BlocProvider.of(context);

  Future<Map<String, dynamic>> getResponse() async {
    String longitude = getLongitude();
    String latitude = getLatitude();
    var response =await AppApiService.getData(longitude: longitude, latitude: latitude);
    return response;

  }
  setSelectCountry({required String country}) {
    _selectedValue1 = country;
    emit(CountryUpdateState());
  }

  List<String> getCountriesListAr() {
    return countriesList.map(
          (e) {
        return e.nameAr;
      },
    ).toList();
  }

  String getSelectCountry() {
    return _selectedValue1;
  }



  String getFirstCity() {
    List<String> city = cityListAr();
    return city[0];
  }

  List<String> cityListAr() {
    for (var country in countriesList) {
      if (country.nameAr == _selectedValue1) {
        return country.getCities();
      }
    }
    return [];
  }

  setCity({required String cityAr}) {
    _cityAr = cityAr;
    getTimePrayer();
    emit(CountryUpdateState());
  }

  String getLatitude() {
    for (var country in countriesList) {
      for (var city in country.cities) {
        if (city.nameAr == _cityAr) {
          return city.latitude ?? "";
        }
      }
    }

    return "";
  }

  String getLongitude() {
    for (var country in countriesList) {
      for (var city in country.cities) {
        if (city.nameAr == _cityAr) {
          return city.longitude ?? "";
        }
      }
    }
    return "";
  }



  Future<TimingModel> getTimePrayer() async {
    var response = await getResponse();
    TimingModel timePrayer = TimingModel.fromJson(response["data"]["timings"]);
    return timePrayer;
  }

  getDateHijri() async {
    var response = await getResponse();
    DateDayModel dateDayModel = DateDayModel.fromJson(response["data"]["date"]);
    HijriModel hijriModel = dateDayModel.hijri;
  }
}
