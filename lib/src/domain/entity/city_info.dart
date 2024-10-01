import 'package:isar/isar.dart';

part 'city_info.g.dart';

@collection
class CityInfo {
  const CityInfo({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.country,
    required this.countryCode,
    this.isPrimaryCity = false,
  });

  final int id;

  final double latitude;
  final double longitude;
  final String name;
  final String country;
  final String countryCode;

  final bool isPrimaryCity;

  factory CityInfo.fromMap(Map<String, dynamic> map) {
    return CityInfo(
      id: DateTime.now().microsecondsSinceEpoch,
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      country: map['country'] ?? "",
      countryCode: map['country_code'] ?? "",
    );
  }

  CityInfo copyWith({
    int? id,
    double? latitude,
    double? longitude,
    String? name,
    String? country,
    String? countryCode,
    bool? isPrimaryCity,
  }) {
    return CityInfo(
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      name: name ?? this.name,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
      isPrimaryCity: isPrimaryCity ?? this.isPrimaryCity,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CityInfo &&
        other.id == id &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.name == name &&
        other.country == country &&
        other.countryCode == countryCode &&
        other.isPrimaryCity == isPrimaryCity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        name.hashCode ^
        country.hashCode ^
        countryCode.hashCode ^
        isPrimaryCity.hashCode;
  }
}
