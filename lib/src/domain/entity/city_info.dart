class CityInfo {
  const CityInfo({
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.country,
    required this.countryCode,
  });

  final double latitude;
  final double longitude;
  final String name;
  final String country;
  final String countryCode;

  factory CityInfo.fromMap(Map<String, dynamic> map) {
    return CityInfo(
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      name: map['name'] ?? '',
      country: map['country	'] ?? "",
      countryCode: map['country_code'] ?? "",
    );
  }
}
