import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/shared/component/reusable_component.dart';
import 'package:task/shared/cubit/home_cubit.dart';
import 'package:task/shared/cubit/home_states.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        var model = HomeCubit.get(context).GetCountries;
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),

                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: const TextStyle(color: Colors.grey),
                      //enabled: false,
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "Can't be empty";
                      }
                    },
                ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Recommended Groups",
                      style: TextStyle(
                        color: HexColor("#45C5BD"),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      " Views All",
                      style: TextStyle(
                          color: HexColor("#000080"),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                ConditionalBuilder(
                    condition: HomeCubit.get(context).GetHome !=null,
                    builder: (context)=> SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics:  BouncingScrollPhysics(),
                          itemBuilder: (context,index)=> InkWell(
                              onTap: (){
                                HomeCubit.get(context).PostJobsByGroupId(groupId: HomeCubit.get(context).GetHome!.groups!.data![index].id!);
                             print("hhhhhhhhhhhhhhhhhhhhhhhhhh${HomeCubit.get(context).GetHome!.groups!.data![index].id}");
                              },
                              child: BuildGroupItem(context, HomeCubit.get(context).GetHome!.groups!.data![index])),
                          separatorBuilder: (context,index)=>SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                          itemCount:  HomeCubit.get(context).GetHome!.groups!.data!.length
                      ),
                    ),
                  fallback: (context)=>Center(child: CircularProgressIndicator(),),

                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                Text(
                  "New Jobs",
                  style: TextStyle(
                      color: HexColor("#45C5BD"),
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                ConditionalBuilder(
                  condition: state is JobsByGroupIdSuccessState,
                  builder: (context)=>SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 25,
                      crossAxisSpacing: 20,
                      childAspectRatio: 1/1.1,
                      children: List.generate(
                        HomeCubit.get(context).jobsByGroupIdModel!.jobs!.data!.length
                        , (index) => BuildJobItem(context, HomeCubit.get(context).jobsByGroupIdModel!.jobs!.data![index]),
                      ),
                    ),
                  ),
                    fallback: (context)=>Center(
                      child: Text(
                        "No Jobs Available",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        fontStyle: FontStyle.italic
                      ),
                      ),),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
