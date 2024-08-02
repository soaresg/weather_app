import 'package:weather_app/core/models/temperature_entity.dart';
import 'package:weather_app/core/models/weather_entity.dart';
import 'package:weather_app/core/models/wind_entity.dart';

class WeatherInfoEntity {
  WeatherInfoEntity({
    required this.dateTime,
    required this.temperature,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.rain,
  });

  DateTime dateTime;
  TemperatureEntity temperature;
  WeatherEntity weather;
  double clouds;
  WindEntity wind;
  double visibility;
  double rain;

  factory WeatherInfoEntity.fromJson(Map<String, dynamic> json) {
    return WeatherInfoEntity(
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      temperature: TemperatureEntity.fromJson(json['main']),
      weather: WeatherEntity.fromJson(json['weather'][0]),
      clouds: json['clouds']['all'].toDouble(),
      wind: WindEntity.fromJson(json['wind']),
      visibility: json['visibility'].toDouble(),
      rain: json['rain'] == null ? 0 : json['rain']['3h'].toDouble(),
    );
  }
}
