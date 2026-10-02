import '../../provider/providers.dart';

mixin StarProgress {
  double caluculateProgress(
    DateTime start,
    DateTime end,
    DateTime selectedDay,
  ) {
    double value = 0;
    if (end.isAfter(start)) {
      final total = end.difference(start).inSeconds;
      final elapsed = selectedDay.difference(start).inSeconds;
      value = (elapsed / total).clamp(0.0, 1.0);
    } else {
      value = 1.0;
    }

    return value;
  }
}

class MoonInfo with StarProgress {
  MoonInfo(this.dailyForecastItems, {required this.selectedHour}) {
    init();
  }

  final List<DailyForecast> dailyForecastItems;
  final DateTime selectedHour;

  late DateTime _rise;
  late DateTime _fall;
  late double _progress;

  DateTime get rise => _rise;
  DateTime get fall => _fall;
  double get progress => _progress;

  void init() {
    assert(
      dailyForecastItems.length > 6 &&
          dailyForecastItems.first.time.isBefore(selectedHour),
    );

    // dart format off
     DateTime moonSet = DateTime.parse(
      dailyForecastItems
          .firstWhere((e) {
            final date = DateTime.tryParse(e.moonSet.value);
            return date != null && date.isAfter(selectedHour);
          }).moonSet.value);

 
    DateTime moonRise = DateTime.parse(
      dailyForecastItems
          .firstWhere((e) {
            final date = DateTime.tryParse(e.moonRise.value);
            return date != null  && date.isBefore(moonSet);
          }).moonRise.value);

    // dart format on

    _rise = moonRise;
    _fall = moonSet;
    _progress = caluculateProgress(_rise, _fall, selectedHour);
  }
}

///  😀 when bug is beautiful,  you can't abounded it. can you?
/// Make poem better

// moon  data
/// OH  moon.. The beauty, Why you are getting over my head?
/// Am I stunted by your beauty, forgot how to think properly?
/// & yet.. I can't abound you.
/// Why is this deception, sometimes in the day and sometimes at night?
/// I asked your neighbor(last-day), she told you were there yesterday..
/// I took the path of yesterday, and again I miss you today.
///
/// You have no light, yet you carry such pride!
/// Would you bless this earthling with your sight?
/// ---
/// I am  the moon, whenever I please roam around
/// Poor earthling... Searching me beneath the day,
/// stunted by appearance, forgetting my essence.
/// Neither yesterday nor tomorrow knows where I am,
/// I will be gone when you arrive.
/// Fall with me, and wander through our memories.
/// Only then,in the echoes, you can find me. 🫠

/// what I  truly care is nearest moonRise and continuous set; might adjust some delay 1-2h later
