import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/core/models/city_entity.dart';
import 'package:weather_app/core/models/weather_info_entity.dart';
import 'package:weather_app/core/open_weather_var.dart';
import 'package:weather_app/core/repositories/weather_repository_interface.dart';

class WeatherRepository implements WeatherRepositoryInterface {
  final OpenWeatherVariables variables = Modular.get<OpenWeatherVariables>();

  CityEntity? city;

  @override
  Future<List<WeatherInfoEntity>> getWeather(
      double latitude, double longitude) async {
    try {
      final response = await http.get(
        Uri.parse(
            '${variables.openHourlyWeatherUrl}?lat=$latitude&lon=$longitude&appid=${variables.apiKey}&units=metric&lang=pt_br'),
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

        city = CityEntity.fromJson(responseDecoded["city"]);

        return listWeather;
      } else {
        debugPrint('Status Code ${response.statusCode}: ${response.body}');
        throw Exception(response.body);
      }
    } catch (e) {
      debugPrint('Error to retrieve data from the API: $e');
      rethrow;
    }
  }

  @override
  Future<WeatherInfoEntity> getCurrentWeather(
      double latitude, double longitude) async {
    try {
      final response = await http.get(
        Uri.parse(
            '${variables.openCurrentWeatherUrl}?lat=$latitude&lon=$longitude&appid=${variables.apiKey}&units=metric&lang=pt_br'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        WeatherInfoEntity weather = WeatherInfoEntity.fromJson(json);

        return weather;
      } else {
        debugPrint('Status Code ${response.statusCode}: ${response.body}');
        throw Exception(response.body);
      }
    } catch (e) {
      debugPrint('Error to retrive data from the API: $e');
      rethrow;
    }
  }
}
