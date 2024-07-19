import 'dart:convert';

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
      dateTime: json['dt_txt'],
      temperature: TemperatureEntity.fromJson(jsonDecode(json['main'])),
      weather: WeatherEntity.fromJson(jsonDecode(json['weather'])),
      clouds: jsonDecode(json['clouds'])['all'],
      wind: WindEntity.fromJson(jsonDecode(json['wind'])),
      visibility: json['visibility'],
      rain: json['rain'] == null ? 0 : jsonDecode(json['rain'])['3h'],
    );
  }
}
