import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/shared/cubit/home_cubit.dart';
import 'package:task/shared/cubit/home_states.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder: (context,state)
      {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Container(
                  height: MediaQuery.of(context).size.width * 0.08,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    color: HexColor("#45C5BD"),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.menu,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Home",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700
                  ),
                ),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(
                      Icons.search,
                      size: 30,
                    )
                ),
              ],
            ),
            flexibleSpace: Container(
              decoration:  BoxDecoration(
                color: HexColor("#000080"),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
            ),

          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.02,
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.transparent
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard_rounded),
                      label: ""
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_bag),
                      label: ""
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.groups),
                      label: ""

                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.email),
                      label: ""

                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: ""

                  ),
                ],
                currentIndex: cubit.currentIndex,
                onTap: (index){
                  cubit.changeBottomNavigation(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}