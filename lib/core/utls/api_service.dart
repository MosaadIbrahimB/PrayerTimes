import 'dart:developer';

import 'package:dio/dio.dart';
import 'api_constant.dart';
import 'date_api_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
class ApiService {
  final Dio _dio;
  final ApiConstant apiConstant = ApiConstant();
  ApiService(this._dio);


  Future<Map<String, dynamic>> getByLatLong( {String? date,  String? latitude,  String ?longitude}) async {
    var url = apiConstant.getFullUrl(date ?? "", latitude??"", longitude??'');
    var response = await _dio.get(url);
    return response.data;
  }


 Future<Map<String,dynamic>>  getByCountryAndCity(String country,String city) async {
  String url=  "https://api.aladhan.com/v1/timingsByCity?country=EG&city=cairo";
  var response = await _dio.get(url);
  return response.data;
  }
}
