import 'package:prayer_times/feature/presentation/data/model/AthanModel.dart';

import '../data/model/TimingsModel.dart';

abstract class AthanState{}
class InitialAthanState extends AthanState{}
class LoadingAthanState extends AthanState{}
class SucceedAthanState extends AthanState{
  final AthanModel ?athanModel;
  final String ?selectedCountry;
  final String ?selectedCity;
  final TimingsModel? prayerTimes ;
  SucceedAthanState({this.selectedCountry, this.selectedCity,  this.athanModel,this.prayerTimes });
}
class ErrorAthanState extends AthanState{
  final String message;
  ErrorAthanState({required this.message});
}
class SelectCountryState extends AthanState{

  SelectCountryState();
}