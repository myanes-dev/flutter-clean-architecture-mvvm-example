import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData light = ThemeData.light();
  static final ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: _darkColors,
  );
}

final ColorScheme _darkColors = ThemeData.dark().colorScheme.copyWith(
      background: Colors.black,
    );
