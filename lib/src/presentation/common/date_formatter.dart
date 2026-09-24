import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtention on DateTime {
  DateTime get tilHour => DateTime(year, month, day, hour);
  String get formatDaily => AppDateFormatter.daily(this);

  String get formatHourly => AppDateFormatter.hourly(this);
  String get formatTDY => AppDateFormatter.hourly(this, true);
  String get formatDetailed => DateFormat('EEE, MMM d, y').format(this);
}

@Deprecated("use DateExtention")
class AppDateFormatter {
  @deprecated
  static String daily(DateTime date) {
    String value = "";
    if (DateUtils.isSameDay(date, DateTime.now())) {
      value = "today";
    } else {
      value = DateFormat.EEEE().format(date);
    }

    //doesn't work expect true mono font but true mono doesn;t look good
    return value.padRight(10);
  }

  static String hourly(DateTime date, [bool stringOnly = false]) {
    final now = DateTime.now();

    if (stringOnly) {
      return DateUtils.isSameDay(date, now)
          ? "TDY"
          : DateUtils.isSameDay(date, now.add(Duration(days: 1)))
          ? "TMR"
          : DateFormat.E().format(date);
    }
    if (DateUtils.isSameDay(date, now) && date.hour == now.hour) {
      return "now";
    }
    return DateFormat.j().format(date);
  }
}
