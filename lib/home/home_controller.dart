import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/models/city_entity.dart';
import 'package:weather_app/core/models/weather_info_entity.dart';
import 'package:weather_app/core/repositories/weather_repository.dart';

class HomeController {
  HomeController();

  final weatherRepository = Modular.get<WeatherRepository>();

  Position? position;
  List<WeatherInfoEntity?> hourlyWeather = [];
  WeatherInfoEntity? currentWeather;
  CityEntity? city;

  Future<bool> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location service is disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      return true;
    } catch (e) {
      debugPrint('Error get Location ${e.toString()}');
      return false;
    }
  }

  Future<bool> getWeather() async {
    try {
      await getCurrentPosition();

      hourlyWeather = await weatherRepository.getWeather(
          position!.latitude, position!.longitude);

      city = weatherRepository.city;

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> todaysWeather() async {
    try {
      await getCurrentPosition();

      currentWeather = await weatherRepository.getCurrentWeather(
          position!.latitude, position!.longitude);

      return true;
    } catch (e) {
      return false;
    }
  }
}
