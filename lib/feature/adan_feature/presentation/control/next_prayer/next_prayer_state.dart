import '../../../domain/model/next_prayer_model.dart';

abstract class NextPrayerState{}
class NextPrayerInitialState extends NextPrayerState{}
class NextPrayerLoadingState extends NextPrayerState{}
class NextPrayerSucceedState extends NextPrayerState{
  NextPrayerModel nextPrayerModel;

  NextPrayerSucceedState({required this.nextPrayerModel});
}

