import 'package:weather_app/core/models/weather_info_entity.dart';

abstract class WeatherRepositoryInterface {
  Future<List<WeatherInfoEntity>> getWeather(double latitude, double longitude);
  Future<WeatherInfoEntity> getCurrentWeather(
      double latitude, double longitude);
}
