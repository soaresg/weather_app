import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/models/weather_info_entity.dart';
import 'package:weather_app/core/repositories/weather_repository.dart';

class HomeController {
  HomeController();

  final weatherRepository = Modular.get<WeatherRepository>();

  List<WeatherInfoEntity?> currentWeather = [];

  Future<void> getWeather() async {
    currentWeather = await weatherRepository.getWeather(-29.9189, -51.1781);
  }
}
