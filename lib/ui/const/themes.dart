import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_2022/ui/const/colors.dart';

class AppThemes {
  static final ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.iosBgColor,
    colorScheme: _lightColors,
  );
  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: _darkColors,
  );
}

final ColorScheme _darkColors = ThemeData.dark().colorScheme.copyWith(
      background: Colors.black,
      onBackground: Colors.white,
    );
final ColorScheme _lightColors = ThemeData.light().colorScheme.copyWith(
      background: AppColors.iosBgColor,
      onBackground: Colors.black,
    );
