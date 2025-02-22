import 'package:prayer_times/feature/adan_feature/domain/model/timing_modle.dart';

abstract class AdanState {}

class AdanInitialState extends AdanState {}

class AdanSucceedState extends AdanState {
  TimingModel timingModel;

  AdanSucceedState({required this.timingModel});
}