import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utls/app_style.dart';
import '../control/next_prayer/next_prayer_cubit.dart';
import '../control/next_prayer/next_prayer_state.dart';

class NextPrayerWidget extends StatelessWidget {
  const NextPrayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextPrayerCubit,NextPrayerState>(
      builder: (context, state) {

        if(state is NextPrayerSucceedState){
          return SizedBox(
            height: 105.h,
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.white12,
                    child: Text(
                      "باقى على : ${state.nextPrayerModel.nextPrayer}",
                      style: AppStyle.textStyle18NotoKufia,
                    )),
                SizedBox(height: 10.h),
                Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.white12,
                    child: Text(
                      state.nextPrayerModel.remainingTimePrayer,
                      style: AppStyle.textStyle18NotoKufia,
                    )),
              ],
            ),
          );
        }
        if(state is NextPrayerLoadingState){
          return Center(child: SizedBox(height:105.h,child: CircularProgressIndicator()),);
        }
        return Center(child: SizedBox(height:105.h,child: Text("الصلاة القادمة")),);
      },
    );
  }
}
