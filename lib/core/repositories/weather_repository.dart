import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/models/weather_info_entity.dart';
import 'package:weather_app/core/open_weather_var.dart';
import 'package:weather_app/core/repositories/weather_repository_interface.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  @override
  Future<List<WeatherInfoEntity>> getWeather(
      double latitude, double longitude) async {
    try {
      final response = await http.get(
        Uri.parse('$openWeatherUrl?lat=$latitude&lon=$longitude&appid=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<WeatherInfoEntity> listWeather = [];
        Map<String, dynamic> responseDecoded = jsonDecode(response.body);
        List<dynamic> weatherHourly = responseDecoded["list"];

        for (var data in weatherHourly) {
          listWeather.add(WeatherInfoEntity.fromJson(data));
        }

        return listWeather;
      } else {
        debugPrint('Status Code ${response.statusCode}: ${response.body}');
        throw Exception(response.body);
      }
    } catch (e) {
      debugPrint('Error to retrive data from de API: $e');
      rethrow;
    }
  }
}
