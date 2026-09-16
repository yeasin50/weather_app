import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '/src/domain/entity/weather_record.dart';
import '../provider/providers.dart';
import '/src/presentation/common/widgets/app_button.dart';
import '/src/presentation/home/widgets/app_bar.dart';
import '../../app/route_config.dart';

import '../widgets/gradient_background.dart';
import 'widgets/my_city_weather_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CityWeatherNotifier>(
      builder: (context, data, child) {
        if (data.city == CityRecord.none) return _EmptyCityView();
        final city = data.city;
        final title = city.name;
        return GradientBackground(
          isImage: true,
          child: Scaffold(
            drawer: AppDrawer(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: HomeAppBar(title: title),
                ),
                Expanded(child: MyCityWeatherView()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _EmptyCityView extends StatelessWidget {
  const _EmptyCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: const Alignment(0, .65),
        child: AppButton.header(
          label: "Find My City",
          onTap: () => context.push(AppRoute.searchCity),
        ),
      ),
    );
  }
}
