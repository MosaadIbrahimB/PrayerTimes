import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prayer_times/core/utls/app_style.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/adan/adan_cubit.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/country/country_cubit.dart';
import 'package:prayer_times/feature/adan_feature/presentation/control/country/country_state.dart';
import 'package:prayer_times/feature/adan_feature/presentation/widget/btn_drop_down_widget.dart';

// class CountryAndCityWidget extends StatelessWidget {
//   const CountryAndCityWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CountryCubit, CountryState>(
//       builder: (context, state) {
//         CountryCubit cubit = BlocProvider.of<CountryCubit>(context);
//         if (state is CountryUpdateState) {
//           return Center(
//             child: Column(
//               children: [
//                 BtnDropDownWidget(
//                   initialSelection: cubit.getSelectCountry(),
//                   listDropDown: cubit
//                       .getCountriesListAr()
//                       .map(
//                         (e) => DropdownMenuEntry(label: e, value: e),
//                       )
//                       .toList(),
//                   onSelected: (value) {
//                     cubit.setSelectCountry(country: value.toString());
//                     cubit.setCity(cityAr: cubit.getFirstCity());
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 BtnDropDownWidget(
//                   initialSelection: cubit.getFirstCity(),
//                   listDropDown: cubit
//                       .cityListAr()
//                       .map(
//                         (e) => DropdownMenuEntry(label: e, value: e),
//                       )
//                       .toList(),
//                   onSelected: (value) {
//                     cubit.setCity(cityAr: value!);
//                   },
//                 ),
//               ],
//             ),
//           );
//         }
//         return Text("Loading");
//       },
//     );
//
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryAndCityWidget extends StatelessWidget {
  const CountryAndCityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      builder: (context, state) {
        CountryCubit cubit = BlocProvider.of<CountryCubit>(context);

        if (state is CountryUpdateState) {
          return Center(
            child: Column(
              children: [
                DropdownMenu(
                  width: double.infinity,
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                  initialSelection: cubit.getSelectCountry(),
                  dropdownMenuEntries: cubit
                      .getCountriesListAr()
                      .map(
                        (e) => DropdownMenuEntry(label: e, value: e),
                      )

                      .toList(),
                  onSelected: (value) {
                    // cubit.setSelectCountry(country: value.toString());
                    // cubit.setCity(cityAr: cubit.getFirstCity());
                    cubit.setSelectCountry(country: value.toString());
                    cubit.setCity(cityAr: cubit.getFirstCity());
                    AdanCubit.get(context).getTimePrayer();
                  },
                  textStyle: Theme.of(context).textTheme.bodyMedium,

                  trailingIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20), // مسافة بين القائمتين
                DropdownMenu(
                  width: double.infinity,
                  inputDecorationTheme: InputDecorationTheme(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.3),
                  ),
                  initialSelection: cubit.getFirstCity(),
                  dropdownMenuEntries: cubit.cityListAr().map((e) {
                    return DropdownMenuEntry<String>(value: e, label: e);
                  }).toList(),
                  onSelected: (value) {
                    // cubit.setCity(cityAr: value!);
                    cubit.setCity(cityAr: value.toString());
                    AdanCubit.get(context).getTimePrayer();
                  },
                  trailingIcon: const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.white,
                  ),
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          );
        }
        return const Text("Loading...");
      },
    );
  }
}

/*
     BtnDropDownWidget(
                  initialSelection: cubit.getSelectCountry(),
                  listDropDown: cubit.getCountriesListAr(),
                  onSelected: (value) {
                    if (value != null) {
                      cubit.setSelectCountry(country: value);
                      cubit.setCity(cityAr: cubit.getFirstCity());
                      AdanCubit.get(context).getTimePrayer();

                    }
                  },
                ),
                const SizedBox(height: 20),
                BtnDropDownWidget(
                  initialSelection: cubit.getFirstCity(),
                  listDropDown: cubit.cityListAr(),
                  onSelected: (value) {
                    if (value != null) {
                      cubit.setCity(cityAr: value);
                      AdanCubit.get(context).getTimePrayer();

                    }
                  },
                ),
 */

/*
    BlocConsumer<CountryCubit, CountryState>(
      listener: (context, state) {
        if (state is CountryUpdateState) {
          AdanCubit.get(context).getTimePrayer();
        }
      },
      builder: (context, state) {
        CountryCubit cubit = BlocProvider.of<CountryCubit>(context);
        if (state is CountryUpdateState) {
          return Center(
            child: Column(
              children: [
                BtnDropDownWidget(
                  initialSelection: cubit.getSelectCountry(),
                  listDropDown: cubit
                      .getCountriesListAr()
                      .map(
                        (e) => DropdownMenuEntry(label: e, value: e),
                      )
                      .toList(),
                  onSelected: (value) {
                    cubit.setSelectCountry(country: value.toString());
                    cubit.setCity(cityAr: cubit.getFirstCity());
                  },
                ),
                const SizedBox(height: 20),
                BtnDropDownWidget(
                  initialSelection: cubit.getFirstCity(),
                  listDropDown: cubit
                      .cityListAr()
                      .map(
                        (e) => DropdownMenuEntry(label: e, value: e),
                      )
                      .toList(),
                  onSelected: (value) {
                    cubit.setCity(cityAr: value!);
                  },
                ),
              ],
            ),
          );
        }
        return Text("Loading");
      },
    );



        DropdownMenu(
                width: double.infinity,
                textStyle: AppStyle.textStyle18NotoKufia,
                trailingIcon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                  color: Colors.white,
                ),
                inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 2,
                      )),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.3),

                ),
                initialSelection: cubit.getSelectCountry(),
                dropdownMenuEntries: cubit
                    .getCountriesListAr()
                    .map(
                      (e) => DropdownMenuEntry(label: e, value: e),
                    )
                    .toList(),
                onSelected: (value) {
                  cubit.setSelectCountry(country: value.toString());
                  cubit.setCity(cityAr: cubit.getFirstCity());
                },
              ),
 */
