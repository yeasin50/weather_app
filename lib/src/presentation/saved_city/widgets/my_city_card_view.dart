import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/route_config.dart';
import '../../../domain/domain.dart';
import '../../../infrastructure/infrastructure.dart';
import '../../widgets/weather_card_view.dart';

class MyCityCardView extends StatelessWidget {
  const MyCityCardView({
    super.key,
    required this.myCity,
    required this.onRemove,
  });

  final VoidCallback? onRemove;

  final (CityInfo, MetroApiResponse)? myCity;

  @override
  Widget build(BuildContext context) {
    if (myCity == null) return const SizedBox.shrink();

    final textTheme = Theme.of(context).textTheme;

    final currentHourData = myCity!.$2.getCurrentHourWeather(DateTime.now());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(
          "My Location",
          style: textTheme.titleLarge,
        ),
        WeatherCard(
          temp: currentHourData!.temperature,
          humidity: currentHourData.humidity,
          rain: currentHourData.rain.toInt(),
          location: myCity!.$1.name,
          mode: currentHourData.mood,
          onTap: () async {
            final bool hasRemoved = await context.push(
                  AppRoute.cityWeatherDetails,
                  extra: {
                    "city": myCity!.$1,
                    "isFromSaved": true,
                  },
                ) ??
                false;
            if (hasRemoved) {
              onRemove?.call();
            }
          },
        ),
      ],
    );
  }
}
