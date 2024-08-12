class TemperatureEntity {
  TemperatureEntity({
    required this.temperature,
    required this.feelsLike,
    required this.minTemperature,
    required this.maxTemperature,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.groundLevel,
  });

  double temperature;
  double feelsLike;
  double minTemperature;
  double maxTemperature;
  double pressure;
  double humidity;
  double seaLevel;
  double groundLevel;

  factory TemperatureEntity.fromJson(Map<String, dynamic> json) {
    return TemperatureEntity(
      temperature: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      minTemperature: json['temp_min'].toDouble(),
      maxTemperature: json['temp_max'].toDouble(),
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'].toDouble(),
      seaLevel: json['sea_level'].toDouble(),
      groundLevel: json['grnd_level'].toDouble(),
    );
  }
}
