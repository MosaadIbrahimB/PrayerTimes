import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/time_hijri_widget.dart';
import '../control/hijri/hijri_cubit.dart';
import '../control/hijri/hijri_state.dart';
class HijriBodyWidget extends StatelessWidget {
  const HijriBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return    BlocBuilder<HijriDateCubit, HijriState>(
      builder: (context, state) {
        if (state is HijriSucceedState) {
          return TimeHijriWidget(hijriModel: state.hijriModel);
        }
        return Container(
          color: Colors.red,
          height: 50,
        );
      },
    );
  }
}
