import 'package:flutter/material.dart';
import '/src/domain/weather_service.dart';

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
      title: Text(cityInfo.name),
      subtitle: Text(cityInfo.location),
    );
  }
}
