import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/layout/home_layout.dart';
import 'package:task/shared/cubit/home_cubit.dart';
import 'package:task/shared/cubit/home_states.dart';
import 'package:task/shared/network/remote/dio_helper.dart';
import 'package:task/shared/styles/theme.dart';


void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context)=>HomeCubit()..getHomeData()..getCountryData(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context,state){},
        builder: (context,state){
          return  MaterialApp(
            theme: light,
            home: const HomeLayout(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}