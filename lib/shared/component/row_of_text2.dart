import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/shared/component/reusable_component.dart';
import 'package:task/shared/cubit/home_cubit.dart';
import 'package:task/shared/cubit/home_states.dart';

class RowOfText2 extends StatelessWidget {
  const RowOfText2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Jobs",
              style: TextStyle(
                  color: HexColor("#45C5BD"),
                  fontWeight: FontWeight.bold
              ),
            ),
            TextButton(
              child: Text(
                " Filter",
                style: TextStyle(
                    color: HexColor("#000080"),
                    fontWeight: FontWeight.bold
                ),
              ),
              onPressed: (){
                showModalBottomSheet(
                    context: context,
                    builder: (_){
                      return ConditionalBuilder(
                        condition: HomeCubit.get(context).getCountries!=null,
                        builder: (context)=>GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 3,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                            childAspectRatio: 2/1,
                            children: List.generate(
                              HomeCubit.get(context).getCountries!.countries!.length
                              , (index) => InkWell(
                                onTap: (){
                                  HomeCubit.get(context).postFilterJobs(
                                    countryId: HomeCubit.get(context).getCountries!.countries![index].id!,
                                  );

                                },
                                child: buildCountryItem(context, HomeCubit.get(context).getCountries!.countries![index])),
                            )
                        ),
                        fallback: (context)=>Center(child: CircularProgressIndicator(),),
                      );
                    }
                );
              },
            ),
          ],
        );
      },
    );
  }
}
