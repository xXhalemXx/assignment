import 'package:assignment/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData defaultTheme = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      scrolledUnderElevation: 0.0,
    ),
  );
}
