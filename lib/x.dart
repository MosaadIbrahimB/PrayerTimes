import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/time_hijri_widget.dart';
import 'feature/adan_feature/presentation/screen/a_view_model.dart';
import 'app_api_service.dart';
import 'feature/adan_feature/presentation/widget/time_prayer_widget.dart';
import 'feature/adan_feature/domain/model/country_model.dart';
import 'feature/adan_feature/domain/model/date_day_model.dart';
import 'feature/adan_feature/domain/model/hijri_model.dart';
import 'feature/adan_feature/domain/model/timing_modle.dart';

class X extends StatelessWidget {
  const X({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CountryCubit(),
          ),
          BlocProvider(
            create: (context) =>
            AdanCubit()
              ..getTimePrayer(context),
          ),
      
          BlocProvider(
            create: (context) =>
            HijriDateCubit(BlocProvider.of<CountryCubit>(context))
              ..getDateHijri(),
          ),
        ],
        child: Column(
          children: [
            CountryAndCityWidget(),
            BlocBuilder<AdanCubit, AdanState>(builder: (context, state) {
              if (state is AdanSucceedState) {
                return TimePrayerWidget(timePrayer: state.timingModel);
              }
              return SizedBox();
            }),
            BlocBuilder<HijriDateCubit, HijriState>(builder: (context, state) {
              if (state is HijriSucceedState) {
                return TimeHijriWidget(hijriModel: state.hijriModel);
              }
      
              return SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}
//
//------------------------------


class CountryAndCityWidget extends StatelessWidget {
   const CountryAndCityWidget({super.key});

   @override
   Widget build(BuildContext context) {
     return  BlocConsumer<CountryCubit, CountryState>(
       listener: (context, state) {
         if (state is CountryUpdateState) {
           AdanCubit.get(context).getTimePrayer(context);
         }
       },
       builder: (context, state) {
         CountryCubit cubit = CountryCubit.get(context);
         return Center(
           child: Column(
             mainAxisSize: MainAxisSize.min,
             children: [
               DropdownMenu(
                 initialSelection: cubit.getSelectCountry(),
                 dropdownMenuEntries: cubit
                     .getCountriesListAr()
                     .map(
                       (e) => DropdownMenuEntry(label: e, value: e),
                 )
                     .toList(),
                 onSelected: (value) {
                   cubit.setSelectCountry(country: value.toString());
                   cubit.setCity(cityAr: cubit.getFirstCity());
                 },
               ),
               const SizedBox(height: 20), // مسافة بين القائمتين
               DropdownMenu(
                 initialSelection: cubit.getFirstCity(),
                 dropdownMenuEntries: cubit.cityListAr().map((e) {
                   return DropdownMenuEntry<String>(value: e, label: e);
                 }).toList(),
                 onSelected: (value) {
                   cubit.setCity(cityAr: value!);
                 },
               ),
             ],
           ),
         );
       },
     );
   }
 }
//
//
// =========================================================
//
//
 class HijriDateCubit extends Cubit<HijriState> {
   CountryCubit countryCubit;

   HijriDateCubit(this.countryCubit) : super(HijriInitialState());

   getDateHijri() async {
     var response = await countryCubit.getResponse();
     DateDayModel dateDayModel = DateDayModel.fromJson(response["data"]["date"]);
     HijriModel hijriModel = dateDayModel.hijri;
     emit(HijriSucceedState(hijriModel: hijriModel));
   }
 }

 abstract class HijriState {}

 class HijriInitialState extends HijriState {}

 class HijriSucceedState extends HijriState {
   HijriModel hijriModel;

   HijriSucceedState({required this.hijriModel});
 }
//
//===========================================
 class CountryCubit extends Cubit<CountryState> {
   String _selectedValue1 = 'مصر'; // القيمة الافتراضية للقائمة الأولى
   String _cityAr = 'القاهرة'; // القيمة الافتراضية للقائمة الثانية
   List<CountryModel> countriesList = AViewModel.countriesList;

   CountryCubit() : super(CountryInitialState());

   static CountryCubit get(BuildContext context) => BlocProvider.of(context);

   List<String> getCountriesListAr() {
     return countriesList.map(
           (e) {
         return e.nameAr??"";
       },
     ).toList();
   }

   String getSelectCountry() {
     return _selectedValue1;
   }

   setSelectCountry({required String country}) {
     _selectedValue1 = country;
     emit(CountryUpdateState());
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

   Future<Map<String, dynamic>> getResponse() async {
     String longitude = getLongitude();
     String latitude = getLatitude();
     var response =
     await AppApiService.getData(longitude: longitude, latitude: latitude);
     return response;
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
//
 abstract class CountryState {}

 class CountryInitialState extends CountryState {}

 class CountryUpdateState extends CountryState {
   CountryUpdateState();
 }
//
// =========================================================
//
 class AdanCubit extends Cubit<AdanState> {
   AdanCubit() : super(AdanInitialState());

   static AdanCubit get(BuildContext context) => BlocProvider.of(context);

   getTimePrayer(BuildContext context) async {
     TimingModel timingModel = await CountryCubit.get(context).getTimePrayer();
     timingModel=getTime(timingModel);
     emit(AdanSucceedState(timingModel: timingModel));
   }


   TimingModel getTime(TimingModel timing) {
     return TimingModel(
         fajr:   getTime12Hour(timing.fajr),
         sunrise:   getTime12Hour(timing.sunrise),
         dhuhr:  getTime12Hour(timing.dhuhr),
         asr:  getTime12Hour(timing.asr),
         maghrib:  getTime12Hour(timing.maghrib),
         isha:  getTime12Hour(timing.isha));
   }

   getTime12Hour(String time) {
     return DateFormat("hh:mm a")
         .format(DateFormat("hh:mm").parse(time))
         .toString();
   }
 }

 abstract class AdanState {}

 class AdanInitialState extends AdanState {}

 class AdanSucceedState extends AdanState {
   TimingModel timingModel;

   AdanSucceedState({required this.timingModel});
 }

//============
//  var response = value.data;
// //
//  setState(
//        () {
//      timePrayer = TimingModel.fromJson(response["data"]["timings"]);
// //     getNextPrayerTime(timePrayer);
//      timePrayer = getTime(timePrayer);
//      DateDayModel dateDay =
//      DateDayModel.fromJson(response["data"]["date"]);
//      hijriDay = dateDay.hijri.numberDay;
//      hijriMonth = dateDay.hijri.month;
//      hijriYear = dateDay.hijri.year;
//      dayName = dateDay.hijri.nameDay;
//    },
//  );
//  },
//  );
