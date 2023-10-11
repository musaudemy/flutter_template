import 'package:flutter/material.dart';
import 'package:tmtrade_sms/src/config/themes/app_colors.dart';

abstract class AppTheme {
  static final appTheme = ThemeData(
    fontFamily: 'OpenSans',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch(
      accentColor: AppColors.main,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: AppColors.light,
      isDense: true,
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.red),
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  );
}
