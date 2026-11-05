import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: AppColors.lightPrimary,
      onPrimary: AppColors.grey,
      secondary: AppColors.darkPrimary,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.lightPrimary,
        fontSize: 24.sp,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        color: AppColors.lightPrimary,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static ThemeData get darkTheme => ThemeData(
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.grey,
      secondary: AppColors.lightPrimary,

    ),
    textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors.darkPrimary,
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
        ),
      titleMedium: TextStyle(
        color: AppColors.darkPrimary,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),

    ),
  );
}
