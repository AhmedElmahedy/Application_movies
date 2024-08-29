import 'package:app_movies/app_colors.dart';
import 'package:flutter/material.dart';

class MyThemeData {
  static final ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.blackColor,
      textTheme:  const TextTheme(
        titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.whiteColor),

      )

  );
}
