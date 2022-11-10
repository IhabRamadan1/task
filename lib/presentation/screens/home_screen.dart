// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:task/data/models/country_with_city.dart';
// import 'package:task/data/models/filter_jobs.dart';
// import 'package:task/data/models/home_group.dart';
// import 'package:task/data/models/jobs_by_group_id.dart';
// import 'package:task/shared/component/reusable_component.dart';
// import 'package:task/business_logic/cubit/home_cubit.dart';
//
// import '../../business_logic/cubit/home_states.dart';
//
// class HomeScreen extends StatefulWidget {
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   //late List<CountryWithCityModel> allCountries;
//
//  // late List<FilterJobsModel> allFilters;
//
//  // late List<HomeGroupModel> allHomes;
//
//   //late List<JobsByGroupIdModel> allJobs;
//
//   @override
//   void initState()
//   {
//     super.initState();
//     //allCountries = BlocProvider.of<HomeCubit>(context).getAllCountries();
//     //allFilters = BlocProvider.of<HomeCubit>(context).PostFilter();
//     //allHomes = BlocProvider.of<HomeCubit>(context).PostHome();
//     //allJobs = BlocProvider.of<HomeCubit>(context).PostJobs();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit,HomeStates>(
//       listener: (context,state){
//         if(state is CountryWithCityLoaded)
//           {
//             //allCountries = state.country;
//           }
//         else if (state is FilterJobsLoaded)
//           {
//             //allFilters = state.filter;
//           }
//         else if (state is HomeGroupLoaded)
//         {
//           //allHomes = state.home;
//         }
//         else if (state is JobsByIdLoaded)
//         {
//          // allJobs = state.jobs;
//         }
//       },
//       builder: (context,state){
//        var model = HomeCubit.get(context);
//         return SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Padding(
//             padding:  EdgeInsets.symmetric(
//               vertical: MediaQuery.of(context).size.height * 0.02,
//               horizontal: MediaQuery.of(context).size.width * 0.04,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height * 0.15,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     image: const DecorationImage(
//                       image: AssetImage("assets/images/background.png"),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(25),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         spreadRadius: 2,
//                         blurRadius: 2,
//                         offset: Offset(0, 3), // changes position of shadow
//                       ),
//                     ],
//                   ),
//
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       //enabled: false,
//                       fillColor: Colors.white,
//                       filled: true,
//                       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                     ),
//                     validator: (value){
//                       if(value!.isEmpty){
//                         return "Can't be empty";
//                       }
//                     },
//                 ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                         "Recommended Groups",
//                       style: TextStyle(
//                         color: HexColor("#45C5BD"),
//                         fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     Text(
//                       " Views All",
//                       style: TextStyle(
//                           color: HexColor("#000080"),
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.2,
//                   width: MediaQuery.of(context).size.width,
//                   child: ListView.separated(
//                       shrinkWrap: true,
//                       scrollDirection: Axis.horizontal,
//                       physics: const BouncingScrollPhysics(),
//                       itemBuilder: (context,index)=> BuildFirstItem(context),
//                       separatorBuilder: (context,index)=>SizedBox(width: MediaQuery.of(context).size.width*0.03,),
//                       itemCount: 6
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//                 Text(
//                   "New Jobs",
//                   style: TextStyle(
//                       color: HexColor("#45C5BD"),
//                       fontWeight: FontWeight.bold
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//                 if(state is CountryWithCityLoaded)
//                 ConditionalBuilder(
//                   condition: state is CountryWithCityLoaded,
//                   builder: (context)=>SizedBox(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     child: GridView.count(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 25,
//                       crossAxisSpacing: 20,
//                       childAspectRatio: 1/1.1,
//                       children: List.generate(
//                           HomeCubit.get(context).country.length
//                         , (index) => BuildLastItem(context, HomeCubit.get(context).country[index], index),
//                       ),
//                     ),
//                   ),
//                     fallback: (context)=>Center(child: CircularProgressIndicator(),),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
