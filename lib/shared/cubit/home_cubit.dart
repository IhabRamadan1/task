import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/models/country_with_city.dart';
import 'package:task/models/home_group.dart';
import 'package:task/models/jobs_by_group_id.dart';
import 'package:task/modules/home_screen.dart';
import 'package:task/modules/messages_screen.dart';
import 'package:task/modules/settings_screen.dart';
import 'package:task/modules/share_screen.dart';
import 'package:task/modules/store_screen.dart';
import 'package:task/shared/cubit/home_states.dart';
import 'package:task/shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates>
{
  HomeCubit():super(HomeInitialState());

  static HomeCubit get(context)=>BlocProvider.of(context);

  //change bottom Navigation

  List<Widget> screens =[
    HomeScreen(),
    StoreScreen(),
    ShareScreen(),
    MessageScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 0;

  void changeBottomNavigation(int index)
  {
    currentIndex = index;
    emit(HomeBottomNavigationState());
  }

  HomeGroupModel? GetHome;
  void GetHomeData()
  {
    emit(HomeGetLoadingState());
    DioHelper.postData(
        url: "https://live-job.dr-recruiter.com/api/guest/homeGroup",
      data: {
          'password':'1790005',
      },

    ).then((value){
      GetHome = HomeGroupModel.fromJson(value.data);
      //print(GetCountries!.message);
      emit(HomeGetSuccessState());
    }).catchError((e){
      emit(HomeGetErrorState(e));
      print(e.toString());
    });
  }


  JobsByGroupIdModel? jobsByGroupIdModel;
  void PostJobsByGroupId({required int groupId})
  {
    print("firsttttttttttttttt $groupId");
    emit(JobsByGroupIdLoadingState());
    DioHelper.postData(
        url: 'https://live-job.dr-recruiter.com/api/guest/jobsByGroupId',
        data: {
          'group_id': groupId,
        }).then((value)
    {
      jobsByGroupIdModel = JobsByGroupIdModel.fromJson(value.data);
      print(jobsByGroupIdModel!.status);
      if(jobsByGroupIdModel!.status==true)
      {
        emit(JobsByGroupIdSuccessState());
      }
    }).catchError((e){
      emit(JobsByGroupIdErrorState(e));
    });
  }


  CountryWithCityModel? GetCountries;
  void GetCountryData()
  {
    emit(CountryGetLoadingState());
    DioHelper.getData(url: "https://live-job.dr-recruiter.com/api/guest/countiresWithCities").then((value){
      GetCountries = CountryWithCityModel.fromJson(value.data);
      print(GetCountries!.message);
      emit(CountryGetSuccessState());
    }).catchError((e){
      emit(CountryGetErrorState(e));
    });
  }

}
