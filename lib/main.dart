import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times/core/utls/api_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'a.dart';
import 'feature/adan_feature/presentation/screen/home_screen.dart';

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
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: child
            // home: BlocProvider(
            //   create: (context) => AthanCube()..getAthan(),
            //   child: HomeScreen(),
            // ),
            );
      },
      child: HomeScreen(),
    );
  }
}

