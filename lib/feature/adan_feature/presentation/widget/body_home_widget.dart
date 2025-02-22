import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/adan/adan_cubit.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/adan/adan_state.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/country/country_cubit.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/hijri/hijri_cubit.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/hijri/hijri_state.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/country_and_city_widget.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/prayer_table_widget.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/time_hijri_widget.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/time_prayer_widget.dart';

class BodyHomeWidget extends StatelessWidget {
  const BodyHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountryCubit(),
        ),
        BlocProvider(
          create: (context) =>
          AdanCubit(BlocProvider.of<CountryCubit>(context))
            ..getTimePrayer(),
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

          BlocBuilder<HijriDateCubit, HijriState>(builder: (context, state) {
            if (state is HijriSucceedState) {
              return TimeHijriWidget(hijriModel: state.hijriModel);
            }

            return SizedBox();
          }),
          BlocBuilder<AdanCubit, AdanState>(builder: (context, state) {
            if (state is AdanSucceedState) {
              return SizedBox(
                  height: 100,
                  child: PrayerTableWidget(prayerTimes:state.timingModel ));
              return TimePrayerWidget(timePrayer: state.timingModel);
            }
            return SizedBox();
          }),
        ],
      ),
    );
  }
}
