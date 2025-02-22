import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:prayer_times/core/utls/api_service.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: HomeScreen()
      // home: BlocProvider(
      //   create: (context) => AthanCube()..getAthan(),
      //   child: HomeScreen(),
      // ),
    );
  }
}

/*
Scaffold(
       appBar: AppBar(),
       body: Center(
         child: SizedBox(
           width: MediaQuery.of(context).size.width*.98,
           child: Column(
             children: [
               Row(
                 children: [
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: [
                         Container(
                           color: Colors.black,
                           child: Text("صلاة الفجر",style: TextStyle(color: Colors.white),),
                         ),
                         Container(
                           color: Colors.red,
                           child: Text("2:20 pm"),
                         ),
                       ],
                     ),
                   ),
                   Expanded(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children: [
                         Container(
                           color: Colors.black,
                           child: Text("صلاة الفجر",style: TextStyle(color: Colors.white),),
                         ),
                         Container(
                           color: Colors.red,
                           child: Text("2:20 pm"),
                         ),
                       ],
                     ),
                   ),
                 ],
               )
             ],
           ),
         ),
       ),
     ),
 */