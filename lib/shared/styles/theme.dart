import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData light = ThemeData(
  scaffoldBackgroundColor: HexColor("#F6F6F6"),
  appBarTheme: const AppBarTheme(
    backwardsCompatibility: true,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    toolbarHeight: 80,
    centerTitle: true,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      //elevation: 20.0,
    backgroundColor: HexColor("#000080"),
  ),
);