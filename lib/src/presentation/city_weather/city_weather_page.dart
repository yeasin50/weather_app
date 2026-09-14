import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/domain/entity/weather_record.dart';
import '../../infrastructure/model/metro_api_payload.dart';
import 'widgets/searched_city_details_view.dart';

import '../../domain/domain.dart';
import '../widgets/gradient_background.dart';

///Might change the logic of ux
class CityWeatherPage extends StatefulWidget {
  const CityWeatherPage({
    super.key,
    required this.city,
    required this.showDeleteButton,
  });
  final CityRecord city;
  final bool showDeleteButton;

  @override
  State<CityWeatherPage> createState() => _CityWeatherPageState();
}

class _CityWeatherPageState extends State<CityWeatherPage> {
  String get location => widget.city.name;

  @override
  Widget build(BuildContext context) {
    // Get the extra data, safely casting to the expected type
    final route = GoRouter.of(context);
    final extra = route.routerDelegate.currentConfiguration.extra;
    print(
      "extra ${extra} ${route.routerDelegate.currentConfiguration.fullPath}",
    );
    return Scaffold(
      body: GradientBackground(
        isImage: false,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              title: Text(widget.city.name),
            ),
            // Expanded(
            //   child: FutureBuilder(
            //     future: future,
            //     builder: (context, snapshot) {
            //       if (snapshot.hasError) {
            //         return Text("${snapshot.error.toString()}");
            //       }
            //
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(child: CircularProgressIndicator());
            //       }
            //
            //       if (snapshot.hasData == true) {
            //         final result = snapshot.data!;
            //
            //         if (result.$2 != null || result.$1 == null) {
            //           return Text(
            //             result.$2?.toString() ?? "something went wrong",
            //           );
            //         }
            //
            //         return SearchedCityDetailsView(
            //           data: result.$1!,
            //           cityInfo: widget.city,
            //           showDeleteButton: widget.showDeleteButton,
            //         );
            //       }
            //
            //       return const Center(child: Text("Ugh..Na state"));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
