import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times/feature/presentation/control/athan_cubit.dart';
import 'package:prayer_times/feature/presentation/screen/home_screen.dart';
import 'package:prayer_times/core/utls/api_service.dart';

import 'a.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar');
  //
  // var dio = Dio();
  // var apiService = ApiService(dio);
  // apiService.getByCountryAndCity("EG", "cairo").then((value) {
  //   print(value.toString());
  // },);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: A(),
      // home: BlocProvider(
      //   create: (context) => AthanCube()..getAthan(),
      //   child: HomeScreen(),
      // ),
    );
  }
}

