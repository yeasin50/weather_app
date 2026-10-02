import 'package:collection/collection.dart';
import 'package:weather_app/src/domain/entity/weather_record.dart';
import '../../provider/providers.dart';
import '../common.dart';

// could be mixin but gonna feed into  class or hold on notifier as cache calculation+ ... in future, so  class
class PreceptionInfo {
  PreceptionInfo({
    required this.selectedHour,
    required this.hourlyData,
    this.maxHourLookup = 3,
  }) {
    init();
  }

  /// It should contains minutes ig, TODO:
  /// because I want to show the exact TIme when rain gonna happen
  final DateTime selectedHour;

  /// from [selectedHour]+ next H lookup for; default 3
  final int maxHourLookup;

  /// selectedHourForcast
  final List<HourlyForecast> hourlyData;

  late WeatherMeasurement _preception;

  String get value => _preception.value;
  String get unit => _preception.unit;

  String _description = "";
  String get description => _description;

  void init() {
    // how does sort + get_> remove VS map skip
    final data = hourlyData.skipWhile((e) => e.time.isBefore(selectedHour));

    _preception = data
        .firstWhere((e) => e.time == selectedHour.tilHour)
        .precipitationProbability; //can skip 2N

    final bool isRaing = (int.tryParse(_preception.value) ?? 0) > 0;

    // if already  raining should I show when  ti gonna be clear?
    /// I can just use now time.minutes but false positive/true-negative of some
    ///? What if I end of day ? so  single day forecast data wont be enough, at-least now->2days
    final lookupEndTime = selectedHour.add(
      Duration(hours: maxHourLookup, minutes: 0),
    );

    final nextChange = data.skip(1).firstWhereOrNull((e) {
      final probability = int.tryParse(e.precipitationProbability.value) ?? 0;

      return e.time.isAfter(selectedHour) &&
          e.time.isBefore(lookupEndTime) &&
          (isRaing ? probability == 0 : probability > 0);
    });

    if (nextChange == null) {
      _description = isRaing ? "Rain continues" : "No rain";
    } else {
      final hours = nextChange.time.difference(selectedHour).inHours;

      _description = isRaing
          ? "Rain stops in ~$hours h"
          : "Rain starts in ~$hours h";
    }
  }
}
