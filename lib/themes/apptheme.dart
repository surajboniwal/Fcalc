import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData getApplicationThemeLight(context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundLight,
      textTheme: getApplicationTextThemeLight(context),
      primaryColor: AppColors.containerBackgroundLight,
      brightness: Brightness.light,
      accentColor: AppColors.buttonBackgroundLight,
    );
  }

  static ThemeData getApplicationThemeDark(context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundDark,
      textTheme: getApplicationTextThemeDark(context),
      primaryColor: AppColors.containerBackgroundDark,
      brightness: Brightness.dark,
      accentColor: AppColors.buttonBackgroundDark,
    );
  }

  static TextTheme getApplicationTextThemeLight(context) {
    return GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme.copyWith(
            bodyText1: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              color: AppColors.buttonTextColorLight,
            ),
          ),
    );
  }

  static TextTheme getApplicationTextThemeDark(context) {
    return GoogleFonts.poppinsTextTheme(
      Theme.of(context).textTheme.copyWith(
            bodyText1: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
              color: AppColors.buttonTextColorDark,
            ),
          ),
    );
  }
}

bool isLightTheme = true;

class AppColors {
  //Lightcolors
  static Color scaffoldBackgroundLight = Color(0xFFFFFFFF);
  static Color containerBackgroundLight = Color(0xFFF9F9F9);
  static Color buttonBackgroundLight = Color(0xFFF4F4F4);
  static Color buttonTextColorLight = Color(0xFF292D36);

  //Darkcolors
  static const Color scaffoldBackgroundDark = Color(0xFF22252D);
  static const Color containerBackgroundDark = Color(0xFF292D36);
  static const Color buttonBackgroundDark = Color(0xFF292B33);
  static const Color buttonTextColorDark = Color(0xFFF8F8F8);
}
