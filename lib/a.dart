import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'feature/athan/domain/model/city_model.dart';
import 'feature/athan/domain/model/country_model.dart';
import 'feature/athan/domain/model/date_day_model.dart';
import 'feature/athan/domain/model/timing_modle.dart';

class A extends StatefulWidget {
  const A({super.key});

  @override
  State<A> createState() => AState();
}

class AState extends State<A> {
  String selectedValue1 = 'مصر'; // القيمة الافتراضية للقائمة الأولى
  String selectedValue2 = 'القاهرة'; // القيمة الافتراضية للقائمة الثانية
  String countryEn = 'EG'; // القيمة الافتراضية للقائمة الأولى
  String cityEn = 'cairo';
  String latitude = "30.033333";
  String longitude = "31.233334";
  TimingModel timePrayer = TimingModel("0", "0", "0", "0", "0", "0");

  String hijriDay = "";
  String hijriMonth = "";
  String hijriYear = "";
  String dayName = "";

  List<DateTime> prayerTimes = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    // String url =
    //     "https://api.aladhan.com/v1/timingsByCity?country=$countryEn&city=$cityEn&method=5&tune=5,1,1,1,1,1,0,0,-6"; // Imsak,Fajr,Sunrise,Dhuhr,Asr,Maghrib,Sunset,Isha,Midnight
    String url =
        "https://api.aladhan.com/v1/timings?latitude=$latitude&longitude=$longitude&method=5";
    Dio().get(url).then((value) {
      var response = value.data;
      setState(() {
        timePrayer = TimingModel.fromJson(response["data"]["timings"]);
        getNextPrayerTime(timePrayer);
        timePrayer = getTime(timePrayer);
        DateDayModel dateDay = DateDayModel.fromJson(response["data"]["date"]);
        hijriDay = dateDay.hijri.numberDay;
        hijriMonth = dateDay.hijri.month;
        hijriYear = dateDay.hijri.year;
        dayName= dateDay.hijri.nameDay;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dropdown Dependency")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownMenu<String>(
              initialSelection: selectedValue1,
              onSelected: (String? value) {
// تحديث القائمة الثانية
                if (value != null) {
                  setState(() {
                    selectedValue1 = value;
                    selectedValue2 = cityListAr(selectedValue1).first;
                  });
                  countryEn = getCountryEn(selectedValue1);
                  cityEn = getCityEn(selectedValue2);
                }
                latitude = getLatitude(selectedValue2);
                longitude = getLongitude(selectedValue2);
                getData();
              },
              dropdownMenuEntries: countriesListAr().map((e) {
                return DropdownMenuEntry<String>(value: e, label: e);
              }).toList(),
            ),
            const SizedBox(height: 20), // مسافة بين القائمتين
            DropdownMenu<String>(
              initialSelection: selectedValue2,
              onSelected: (String? value) {
                if (value != null) {
                  setState(() {
                    selectedValue2 = value;
                  });
                }
                countryEn = getCountryEn(selectedValue1);
                cityEn = getCityEn(selectedValue2);
                latitude = getLatitude(selectedValue2);
                longitude = getLongitude(selectedValue2);
                getData();
              },
              dropdownMenuEntries: cityListAr(selectedValue1).map((e) {
                return DropdownMenuEntry<String>(value: e, label: e);
              }).toList(),
            ),
            Text(dayName),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(DateFormat('y').format(DateTime.now())),
                SizedBox(
                  width: 10,
                ),
                Text(DateFormat('MMMM', 'ar').format(DateTime.now())),
                SizedBox(
                  width: 10,
                ),
                Text(DateFormat('d').format(DateTime.now())),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(hijriYear),
                SizedBox(
                  width: 10,
                ),
                Text(hijriMonth),
                SizedBox(
                  width: 10,
                ),
                Text(hijriDay),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("صلاة العشاء"),
                          Text(timePrayer.isha),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("صلاة المغرب"),
                          Text(timePrayer.maghrib),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("صلاة العصر"),
                          Text(timePrayer.asr),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("صلاة الظهر"),
                          Text(timePrayer.dhuhr),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("الشروق"),
                          Text(timePrayer.sunrise),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("صلاة الفجر"),
                          Text(timePrayer.fajr),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getNextPrayerTime(TimingModel timings) {
    DateTime now = DateTime.now();
    Map<DateTime, String> prayerTimes = timings.getPrayerTimes();

    DateTime? nextPrayer;
    String? nextPrayerName;

    for (var entry in prayerTimes.entries) {
      if (entry.key.isAfter(now)) {
        nextPrayer = entry.key;
        nextPrayerName = entry.value;
        break;
      }
    }

    // في حالة انتهاء جميع الصلوات، تحديد الفجر لليوم التالي
    if (nextPrayer == null) {
      nextPrayer = prayerTimes.keys.first.add(Duration(days: 1));
      nextPrayerName = prayerTimes.values.first;
    }

    // حساب المدة المتبقية
    Duration remainingTime = nextPrayer.difference(now);
//    الساعة ${DateFormat('HH:mm').format(nextPrayer)}عند
    print("باقى على : $nextPrayerName  ");
    print(
        "الوقت المتبقي: ${remainingTime.inHours} ساعة و ${remainingTime.inMinutes % 60} دقيقة");
  }

  //قائمة الدول
  final List<CountryModel> countriesList = [
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

  List<String> countriesListAr() {
    return countriesList.map(
      (e) {
        return e.nameAr;
      },
    ).toList();
  }

  List<String> cityListAr(String countryAr) {
    for (var country in countriesList) {
      if (country.nameAr == countryAr) {
        return country.getCities();
      }
    }
    return [];
  }

  String getCountryEn(String countryAr) {
    for (var country in countriesList) {
      if (country.nameAr == countryAr) {
        return country.nameEn;
      }
    }
    return "";
  }

  String getCityEn(String cityAr) {
    for (var country in countriesList) {
      for (var city in country.cities) {
        if (city.nameAr == cityAr) {
          return city.nameEn;
        }
      }
    }
    return "";
  }

  String getLatitude(String cityAr) {
    for (var country in countriesList) {
      for (var city in country.cities) {
        if (city.nameAr == cityAr) {
          return city.latitude ?? "";
        }
      }
    }
    return "";
  }

  String getLongitude(String cityAr) {
    for (var country in countriesList) {
      for (var city in country.cities) {
        if (city.nameAr == cityAr) {
          return city.longitude ?? "";
        }
      }
    }
    return "";
  }

  TimingModel getTime(TimingModel timing) {
    return TimingModel(
        getTime12Hour(timing.fajr),
        getTime12Hour(timing.sunrise),
        getTime12Hour(timing.dhuhr),
        getTime12Hour(timing.asr),
        getTime12Hour(timing.maghrib),
        getTime12Hour(timing.isha));
  }

  getTime12Hour(String time) {
    return DateFormat("hh:mm a")
        .format(DateFormat("hh:mm").parse(time))
        .toString();
  }

}

// Uri.parse("https://api.aladhan.com/v1/timingsByAddress/19-02-2025?address=cairo+%2C+EG&method=5&shafaq=general&tune=5%2C3%2C5%2C1%2C13%2C1%2C0%2C0%2C-6&school=1&timezonestring=Africa%2FCairo&calendarMethod=UAQ"),// Imsak,Fajr,Sunrise,Dhuhr,Asr,Maghrib,Sunset,Isha,Midnight
