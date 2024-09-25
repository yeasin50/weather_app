import 'package:flutter/material.dart';

import '../../../domain/entity/city_info.dart';

class SearchedCityTile extends StatelessWidget {
  const SearchedCityTile({
    super.key,
    required this.cityInfo,
  });

  final CityInfo cityInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${cityInfo.name},${cityInfo.country}"),
    );
  }
}
