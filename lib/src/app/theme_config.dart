import 'package:flutter/material.dart';

class AppTheme {
  static ThemeMode _mode = ThemeMode.dark;
  static ThemeMode get mode => _mode;

  static ThemeData theme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.indigo,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
