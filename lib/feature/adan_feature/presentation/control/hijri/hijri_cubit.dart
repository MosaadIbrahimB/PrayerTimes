import 'package:bloc/bloc.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/date_day_model.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/hijri_model.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/country/country_cubit.dart';

import 'hijri_state.dart';

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
