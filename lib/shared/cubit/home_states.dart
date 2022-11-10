import 'package:task/models/country_with_city.dart';
import 'package:task/models/filter_jobs.dart';
import 'package:task/models/home_group.dart';
import 'package:task/models/jobs_by_group_id.dart';

abstract class HomeStates{}
class HomeInitialState extends HomeStates{}

//for bottom navigation
class HomeBottomNavigationState extends HomeStates{}

//Post data
class HomePostLoadingState extends HomeStates{}
class HomePostSuccessState extends HomeStates{}
class HomePostErrorState extends HomeStates{
  final String error;

  HomePostErrorState(this.error);
}

//Get Country data

class CountryGetLoadingState extends HomeStates{}
class CountryGetSuccessState extends HomeStates{}
class CountryGetErrorState extends HomeStates{
  final String error;

  CountryGetErrorState(this.error);
}

//get home
class HomeGetLoadingState extends HomeStates{}
class HomeGetSuccessState extends HomeStates{}
class HomeGetErrorState extends HomeStates{
  final String error;

  HomeGetErrorState(this.error);
}

//post JobsByGroupId
class JobsByGroupIdLoadingState extends HomeStates{}
class JobsByGroupIdSuccessState extends HomeStates{}
class JobsByGroupIdErrorState extends HomeStates{
  final String error;

  JobsByGroupIdErrorState(this.error);
}


// //country with city
// class CountryWithCityLoaded extends HomeStates{
//   final List<CountryWithCityModel> country;
//   CountryWithCityLoaded(this.country);
// }
//
// //filter jobs
// class FilterJobsLoaded extends HomeStates{
//   final List<FilterJobsModel> filter;
//   FilterJobsLoaded(this.filter);
// }
//
// //home group
// class HomeGroupLoaded extends HomeStates{
//   final List<HomeGroupModel> home;
//   HomeGroupLoaded(this.home);
// }
//
// //jobs by id group
// class JobsByIdLoaded extends HomeStates{
//   final List<JobsByGroupIdModel> jobs;
//   JobsByIdLoaded(this.jobs);
// }

