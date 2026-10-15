import 'package:flutter/material.dart';

class TemparatureData {
  static Color color(double temp) {
    if (temp <= 0) return const Color(0xFF4575B4);
    if (temp <= 10) return const Color(0xFF74ADD1);
    if (temp <= 20) return const Color(0xFFABD9E9);
    if (temp <= 25) return const Color(0xFFFFFFBF);
    if (temp <= 30) return const Color(0xFFFEE090);
    if (temp <= 35) return const Color(0xFFFDAE61);
    if (temp <= 40) return const Color(0xFFF46D43);
    if (temp <= 45) return const Color(0xFFD73027);

    return const Color(0xFF7F0000);
  }

  static List<Color> colors(double maxTemp) => [
    const Color(0xFF4575B4), // Blue
    const Color(0xFF74ADD1), // Cool
    const Color(0xFFFFD54F), // Yellow
    if (maxTemp > 25) const Color(0xFFFDAE61), // Orange
    if (maxTemp > 35) const Color(0xFFD73027), // Red
    if (maxTemp > 45) const Color(0xFF7F0000), // Dark red
  ];
}
