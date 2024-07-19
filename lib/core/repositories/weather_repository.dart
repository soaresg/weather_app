import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/open_weather_var.dart';

import 'package:weather_app/core/models/weather_info_entity.dart';
import 'package:weather_app/core/repositories/weather_repository_interface.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  @override
  Future<WeatherInfoEntity> getWeather(
      double latitude, double longitude) async {
    try {
      final response = await http.get(
        Uri.parse('$openWeatherUrl?lat=$latitude&lon=$longitude&appid=$apiKey'),
      );

      if (response.statusCode == 200) {
        WeatherInfoEntity weatherInfo =
            WeatherInfoEntity.fromJson(jsonDecode(response.body));

        return weatherInfo;
      } else {
        debugPrint('Status Code ${response.statusCode}: ${response.body}');
        throw Exception(response.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
