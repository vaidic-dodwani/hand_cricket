import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static const String fontFamily = 'Poppins';

  static TextTheme textTheme = const TextTheme(
    displayLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w900,
        fontSize: 96,
        color: AppColors.highlightColor),
    displayMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800,
        fontSize: 60,
        color: AppColors.highlightColor),
    displaySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 48,
        color: AppColors.highlightColor),
    headlineLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 40,
        color: AppColors.highlightColor),
    headlineMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 34,
        color: AppColors.highlightColor),
    headlineSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: AppColors.highlightColor),
    titleLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: AppColors.accentColor),
    titleMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: AppColors.accentColor),
    titleSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.accentColor),
    bodyLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: Colors.white),
    bodyMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w300,
        fontSize: 14,
        color: Colors.white),
    bodySmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w200,
        fontSize: 12,
        color: Colors.white),
    labelLarge: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: AppColors.accentColor),
    labelMedium: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w300,
        fontSize: 12,
        color: AppColors.accentColor),
    labelSmall: TextStyle(
        fontFamily: fontFamily,
        fontWeight: FontWeight.w200,
        fontSize: 10,
        color: AppColors.accentColor),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    fontFamily: fontFamily,
    textTheme: textTheme,
    useMaterial3: true,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
      tertiary: AppColors.highlightYellow,
      error: AppColors.errorColor,
      surface: AppColors.secondaryColor,
    ),
  );
}
