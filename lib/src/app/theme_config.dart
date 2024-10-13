import 'package:flutter/material.dart';

class AppTheme {
  static const appBarBG = Color(0xAA343464);

  static ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
  );
}
