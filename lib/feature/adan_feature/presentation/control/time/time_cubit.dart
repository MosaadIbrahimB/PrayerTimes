import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';

class TimeCubit extends Cubit<String> {
  late Timer _timer;

  TimeCubit() : super(_getCurrentTime()) {
    _startTimer();
  }

  static String _getCurrentTime() {
    return DateFormat('hh:mm a', 'ar').format(DateTime.now());
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      emit(_getCurrentTime()); // تحديث الحالة بالوقت الجديد
    });
  }

  @override
  Future<void> close() {
    _timer.cancel(); // إيقاف المؤقت عند التخلص من الكيوبت
    return super.close();
  }
}