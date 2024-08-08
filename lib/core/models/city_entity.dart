class CityEntity {
  CityEntity({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  int id;
  String name;
  double latitude;
  double longitude;
  String country;
  DateTime sunrise;
  DateTime sunset;

  factory CityEntity.fromJson(Map<String, dynamic> json) {
    return CityEntity(
      id: json["id"],
      name: json["name"],
      latitude: json["coord"]["lat"].toDouble(),
      longitude: json["coord"]["lon"].toDouble(),
      country: json["country"],
      sunrise: DateTime.fromMillisecondsSinceEpoch(json["sunrise"]),
      sunset: DateTime.fromMillisecondsSinceEpoch(json["sunset"]),
    );
  }
}
