import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times/feature/adan_feature/domain/model/timing_modle.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/adan/adan_state.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/country/country_cubit.dart';

class AdanCubit extends Cubit<AdanState> {
  CountryCubit countryCubit;
  AdanCubit(this.countryCubit) : super(AdanInitialState());

  static AdanCubit get(BuildContext context) => BlocProvider.of(context);

  getTimePrayer() async {
    TimingModel timingModel = await countryCubit.getTimePrayer();
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
