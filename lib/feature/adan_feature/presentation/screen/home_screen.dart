import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/adan/adan_cubit.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/country/country_cubit.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/hijri/hijri_cubit.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/body_home_widget.dart';
import '../control/next_prayer/next_prayer_cubit.dart';
import '../control/time/time_cubit.dart';
import '../widget/app_bar_widget.dart';
import '../widget/back_ground_home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackGroundHomeScreenWidget(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBarWidget(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MultiBlocProvider(
                providers: funProviders(),
                child: BodyHomeWidget(),
              ),
            ),
          ),
        ),
      ),
    );
  }
  funProviders(){
    return [
      BlocProvider(
        create: (context) => CountryCubit(),
      ),
      BlocProvider(
        create: (context) =>
        AdanCubit(BlocProvider.of<CountryCubit>(context))
          ..getTimePrayer(),
      ),
      BlocProvider(
        create: (context) => TimeCubit(),

      ),
      BlocProvider(
        create: (context) =>
        HijriDateCubit(BlocProvider.of<CountryCubit>(context))
          ..getDateHijri(),
      ),
      BlocProvider(
        create: (context) =>
        NextPrayerCubit(countryCubit: BlocProvider.of<CountryCubit>(context))
          ..getNextPrayerTime(),
      ),


    ];

  }
}