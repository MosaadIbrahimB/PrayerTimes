import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:prayer_times/core/utls/api_service.dart';
import 'package:prayer_times/feature/presentation/control/athan_state.dart';
import 'package:prayer_times/feature/presentation/data/model/AthanModel.dart';

import '../data/model/TimingsModel.dart';

class AthanCube extends Cubit<AthanState> {
  AthanCube() : super(InitialAthanState());

  void getAthan() async {
    emit(LoadingAthanState());
    try {

      ApiService apiService = ApiService(Dio());
  apiService.getByCountryAndCity("EG", "cairo").then((value) {


    AthanModel athanModel = AthanModel.fromJson(value);

    TimingsModel? timings =athanModel.data!.timings;



    emit(SucceedAthanState(athanModel: athanModel, prayerTimes: timings));

  },);
    } catch (e) {
      emit(ErrorAthanState(message: e.toString()));
    }
  }
}