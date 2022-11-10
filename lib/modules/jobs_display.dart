// import 'package:conditional_builder/conditional_builder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task/shared/cubit/home_cubit.dart';
// import 'package:task/shared/cubit/home_states.dart';
//
// class DisplayJobs extends StatelessWidget {
//   const DisplayJobs({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HomeCubit,HomeStates>(
//       listener: (context,state){},
//       builder: (context,state){
//         return ConditionalBuilder(
//           condition: model!=null,
//           builder: (context)=>SizedBox(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: GridView.count(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               mainAxisSpacing: 25,
//               crossAxisSpacing: 20,
//               childAspectRatio: 1/1.1,
//               children: List.generate(
//                 model!.countries!.length
//                 , (index) => BuildLastItem(context, model.countries![index]),
//               ),
//             ),
//           ),
//           fallback: (context)=>Center(child: CircularProgressIndicator(),),
//         );
//       },
//     );
//   }
// }
