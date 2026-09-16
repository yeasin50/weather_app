import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '/src/presentation/provider/weather_provider.dart';

import '/src/presentation/widgets/gradient_background.dart';
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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GradientBackground(
          isImage: false,
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
