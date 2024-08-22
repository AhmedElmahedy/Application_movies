import 'package:flutter/material.dart';
import 'app_colors.dart';

class MyThemeData {
  static final ThemeData appTheme = ThemeData(
    // primaryColor: AppColors.blackColor,
    bottomNavigationBarTheme:  const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.blackColor,
      unselectedItemColor: AppColors.whiteColor,
    ),
    textTheme:  TextTheme(
      titleSmall: TextStyle(
          color:AppColors.yellowColor ,
          fontSize: 14 ,
          fontWeight: FontWeight.w400
      ),
      titleMedium: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 25)
    ),
  );
}
