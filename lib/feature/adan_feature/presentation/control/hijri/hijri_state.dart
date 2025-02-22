import 'package:prayer_times/feature/adan_feature/domain/model/hijri_model.dart';


abstract class HijriState {}

class HijriInitialState extends HijriState {}

class HijriSucceedState extends HijriState {
  HijriModel hijriModel;

  HijriSucceedState({required this.hijriModel});
}