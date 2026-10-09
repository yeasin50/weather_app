import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeMode _mode = ThemeMode.dark;
  static ThemeMode get mode => _mode;

  static ThemeData theme(BuildContext context) {
    const background = Color(0xFF0B1220);
    const surface = Color(0xFF121C2E);
    const primary = Color(0xFF62B6FF);

    final base = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        onPrimary: Colors.white,
        secondary: Color(0xFF8ED8FF),
        surface: surface,
        onSurface: Colors.white,
      ),
    );

    return base.copyWith(
      textTheme: GoogleFonts.manropeTextTheme(base.textTheme),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.grey.shade50,
        labelPadding: .symmetric(horizontal: 16),
        dividerHeight: .5,
        labelStyle: TextStyle(fontSize: 16),
        unselectedLabelStyle: TextStyle(fontSize: 16),
        indicatorSize: .tab,
        tabAlignment: .start,
      ),
    );
  }
}
