import 'package:flutter/material.dart';
import 'package:healthcare/src/presentation/config/app_color.dart';

class AppThemes {
  static final ThemeData base = ThemeData.light();

  ThemeData buildLightTheme() {
    return base.copyWith(
      cardColor: Colors.white,
      backgroundColor: Colors.black,
      primaryColor: AppColor.colorOrange,
      scaffoldBackgroundColor: Colors.white,
    );
  }

  ThemeData buildDarkTheme() {
    return base.copyWith(
      cardColor: Colors.grey[800],
      backgroundColor: Colors.grey[800],
      primaryColor: AppColor.colorWhile,
      scaffoldBackgroundColor: Colors.grey[900],
    );
  }
}
