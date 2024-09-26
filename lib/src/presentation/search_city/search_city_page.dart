import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/domain/domain.dart';
import 'package:weather_app/src/infrastructure/repository/location_repo.dart';
import 'package:weather_app/src/presentation/widgets/gradient_background.dart';

import 'widgets/search_city_tile.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  final LocationRepo repo = LocationRepo();

  void onQueryChange(String q) async {
    repo.searchWithDelay(q);
  }

  @override
  void dispose() {
    repo.dispose();
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
                  onChanged: onQueryChange,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            StreamBuilder<List<CityInfo>>(
              stream: repo.dataStream,
              builder: (context, snapshot) {
                if (snapshot.hasData == false) {
                  return const SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                print("cityInfoLength: ${snapshot.data?.length}");
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) => SearchedCityTile(
                      cityInfo: snapshot.data![index],
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
