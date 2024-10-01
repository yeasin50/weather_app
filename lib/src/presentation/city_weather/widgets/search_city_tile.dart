import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/src/app/route_config.dart';

import '../../../domain/entity/city_info.dart';

class SearchedCityTile extends StatelessWidget {
  const SearchedCityTile({
    super.key,
    required this.cityInfo,
    required this.onTap,
  });

  final CityInfo cityInfo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text("${cityInfo.name}, ${cityInfo.countryCode}"),
      subtitle: Text("Lat:${cityInfo.latitude} Lon:${cityInfo.longitude}, ${cityInfo.country}"),
    );
  }
}
