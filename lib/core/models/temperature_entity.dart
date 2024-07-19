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
      temperature: json['temp'],
      feelsLike: json['feels_like'],
      minTemperature: json['temp_min'],
      maxTemperature: json['temp_max'],
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      groundLevel: json['grnd_level'],
    );
  }
}
