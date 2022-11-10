// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:task/shared/component/reusable_component.dart';
// import 'package:task/business_logic/cubit/home_cubit.dart';
// import 'package:task/shared/cubit/home_states.dart';
//
// class SearchScreen extends StatelessWidget
// {
//   var SearchController = TextEditingController();
//   @override
//   Widget build(BuildContext context)
//   {
//     return BlocConsumer<HomeCubit,HomeStates>(
//       listener: (context,state){},
//       builder: (context,state){
//         var model = HomeCubit.get(context).search;
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: HexColor("#000080"),
//           ),
//           body: Padding(
//           padding: EdgeInsets.symmetric(
//             vertical: MediaQuery.of(context).size.height * 0.02,
//             horizontal: MediaQuery.of(context).size.width * 0.04,),
//             child: Column(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                   child: TextFormField(
//                     controller: SearchController,
//                     keyboardType: TextInputType.text,
//                     onFieldSubmitted: (String text){
//                       HomeCubit.get(context).PostSearch(text: text);
//                     },
//                     decoration: InputDecoration(
//                       hintText: "Search",
//                       hintStyle: const TextStyle(color: Colors.grey),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//                 if(model != null)
//                 Expanded(
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height,
//                     width: MediaQuery.of(context).size.width,
//                     child: ListView.separated(
//                       physics: BouncingScrollPhysics(),
//                       shrinkWrap: true,
//                       itemBuilder: (context,index)=>BuildSearchItem(context, model.jobs!.data![index]),
//                       separatorBuilder: (context,index)=>SizedBox(height: MediaQuery.of(context).size.height*0.02,),
//                       itemCount: model.jobs!.data!.length,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
