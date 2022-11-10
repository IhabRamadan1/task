// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task/business_logic/cubit/home_cubit.dart';
// import 'package:task/data/repository/country_with_city_repository.dart';
// import 'package:task/data/repository/filter_jobs_repository.dart';
// import 'package:task/data/repository/home_group_repository.dart';
// import 'package:task/data/repository/jobs_by_group_id_repository.dart';
// import 'package:task/data/web_services/dio_helper.dart';
//
// import 'layout/home_layout.dart';
//
// class AppRouter{
//   late HomeCubit homeCubit;
//   late CountryWithCityRepsoitory countryWithCityRepsoitory;
//   late FilterJobsRepository filterJobsRepository;
//   late HomeGroupRepository homeGroupRepository;
//   late JobsByIdRepository jobsByIdRepository;
//   AppRouter(){
//     countryWithCityRepsoitory = CountryWithCityRepsoitory(DioHelper());
//     filterJobsRepository = FilterJobsRepository(DioHelper());
//     homeGroupRepository = HomeGroupRepository(DioHelper());
//     jobsByIdRepository=JobsByIdRepository(DioHelper());
//     homeCubit = HomeCubit(countryWithCityRepsoitory, filterJobsRepository, homeGroupRepository, jobsByIdRepository);
//   }
//   Route? generateRoute(RouteSettings settings){
//     switch(settings.name){
//       case '/': return MaterialPageRoute(builder:(_)=>
//       BlocProvider(
//           create: (BuildContext context)=>
//           HomeCubit(countryWithCityRepsoitory, filterJobsRepository, homeGroupRepository, jobsByIdRepository)..getAllCountries(),
//         child: HomeLayout(),
//       ),
//       );
//     }
//   }
// }