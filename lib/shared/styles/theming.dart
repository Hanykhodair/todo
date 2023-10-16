import 'package:flutter/material.dart';
import 'package:todo/shared/styles/colors.dart';

class MyThemeData{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: mintGreen,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primary ,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.transparent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),),
    ),);
  static ThemeData darkTheme =ThemeData();

}