import 'package:dio/dio.dart';


class AppApiService {

 static Future<Map<String, dynamic>> getData({required String longitude , required String latitude}) async {
    String url = "https://api.aladhan.com/v1/timings?latitude=$latitude&longitude=$longitude&method=5";
    final response = await  Dio().get(url);
    Map<String, dynamic> data = response.data;
    return data;
  }
}
// String url =
//     "https://api.aladhan.com/v1/timingsByCity?country=$countryEn&city=$cityEn&method=5&tune=5,1,1,1,1,1,0,0,-6"; // Imsak,Fajr,Sunrise,Dhuhr,Asr,Maghrib,Sunset,Isha,Midnight
