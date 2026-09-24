import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../infrastructure/model/metro_api_weather_code.dart';
import '../common/weather_value_formatter.dart';
import '/src/presentation/provider/weather_provider.dart';

import '../../domain/weather_service.dart';
import '../city_weather/widgets/search_city_tile.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  late final repo = context.read<IWeatherService>();

  final TextEditingController controller = TextEditingController();
  bool get isEmptySearch => controller.text.trim().isEmpty;

  void onQueryChange(String q) => repo.searchCity(q);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: CupertinoSearchTextField(
                    controller: controller,
                    onChanged: onQueryChange,
                    autofocus: true,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: ValueListenableBuilder(
                  valueListenable: controller,
                  builder: (context, value, child) {
                    return value.text.trim().isEmpty
                        ? SavedCitiesOnSearchView()
                        : SizedBox();
                  },
                ),
              ),

              /// ....
              StreamBuilder<List<CityInfo>>(
                initialData: const [],
                stream: repo.searchedCityResult,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return SliverFillRemaining(
                      child: Center(child: Text(snapshot.error.toString())),
                    );
                  }

                  if ((snapshot.data ?? []).isEmpty) {
                    return SliverFillRemaining(
                      child: Center(
                        child: Text(
                          isEmptySearch ? "" : "No city found, keep searching",
                        ),
                      ),
                    );
                  }
                  final items = snapshot.data ?? [];
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) => SearchedCityTile(
                        cityInfo: items[index],
                        onTap: () {
                          context.read<WeatherNotifier>().addCity(items[index]);
                          context.pop();
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavedCitiesOnSearchView extends StatelessWidget {
  const SavedCitiesOnSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherNotifier>(
      builder: (context, value, child) {
        final cities = value.savedCities;
        return Column(
          children: [
            ...cities.map((e) {
              return ListTile(
                leading: Icon(
                  WeatherType.fromCode(e.currentHourCode.value).icon,
                ),
                title: Text(e.city.name),
                subtitle: Text(e.city.location),
                onTap: () {
                  context.read<WeatherNotifier>().changeCity(e.city.id);
                  context.pop();
                },
              );
            }),
          ],
        );
      },
    );
  }
}
