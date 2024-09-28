import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/infrastructure/repository/location_repo.dart';
import 'package:weather_app/src/presentation/widgets/gradient_background.dart';

import '../../app/route_config.dart';
import 'widgets/search_city_tile.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  final LocationRepo repo = LocationRepo();

  final TextEditingController controller = TextEditingController();
  bool get isEmptySearch => controller.text.trim().isEmpty;

  void onQueryChange(String q) async {
    repo.searchWithDelay(q);
  }

  @override
  void dispose() {
    repo.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        isImage: false,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.transparent,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CupertinoSearchTextField(
                  controller: controller,
                  onChanged: onQueryChange,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            StreamBuilder<List<CityInfo>>(
              initialData: const [],
              stream: repo.dataStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(snapshot.error.toString()),
                    ),
                  );
                }

                if ((snapshot.data ?? []).isEmpty) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(isEmptySearch ? "" : "No city found, keep searching"),
                    ),
                  );
                }

                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) => SearchedCityTile(
                      cityInfo: snapshot.data![index],
                      onTap: () {
                        context.push(AppRoute.cityWeatherDetails, extra: snapshot.data![index]);
                      },
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
