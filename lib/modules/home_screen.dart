import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/shared/component/home_banner.dart';
import 'package:task/shared/component/reusable_component.dart';
import 'package:task/shared/component/row_of_text.dart';
import 'package:task/shared/component/row_of_text2.dart';
import 'package:task/shared/component/search_home.dart';
import 'package:task/shared/cubit/home_cubit.dart';
import 'package:task/shared/cubit/home_states.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
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
                const HomeBanner(),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                const SearchHome(),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                const RowOfText(),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                ConditionalBuilder(
                    condition: HomeCubit.get(context).getHome !=null,
                    builder: (context)=> SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics:  BouncingScrollPhysics(),
                          itemBuilder: (context,index)=> InkWell(
                              onTap: (){
                                HomeCubit.get(context).postJobsByGroupId(groupId: HomeCubit.get(context).getHome!.groups!.data![index].id!);
                              },
                              child: buildGroupItem(context, HomeCubit.get(context).getHome!.groups!.data![index])),
                          separatorBuilder: (context,index)=>SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                          itemCount:  HomeCubit.get(context).getHome!.groups!.data!.length
                      ),
                    ),
                  fallback: (context)=>Center(child: CircularProgressIndicator(),),

                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                const RowOfText2(),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                if(state is JobsByGroupIdSuccessState)
                ConditionalBuilder(
                  condition: HomeCubit.get(context).jobsByGroupIdModel!=null,
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
                        , (index) => buildJobByIdItem(context, HomeCubit.get(context).jobsByGroupIdModel!.jobs!.data![index]),
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
                if(state is FilterJobsSuccessState)
                  ConditionalBuilder(
                    condition: state is FilterJobsSuccessState,
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
                          HomeCubit.get(context).filterJobsModel!.jobs!.data!.length
                          , (index) => buildJobByCountryItem(context, HomeCubit.get(context).filterJobsModel!.jobs!.data![index]),
                        ),
                      ),
                    ),
                    fallback: (context)=>Center(
                      child: CircularProgressIndicator(),),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}




