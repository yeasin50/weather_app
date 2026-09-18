import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppDateFormatter {
  static String daily(DateTime date) {
    if (DateUtils.isSameDay(date, DateTime.now())) {
      return "today";
    }

    return DateFormat.E().format(date);
  }

  static String hourly(DateTime date) {
    final now = DateTime.now();
    if (DateUtils.isSameDay(date, now) && date.hour == now.hour) {
      return "now";
    }
    return DateFormat.j().format(date);
  }
}
