import 'package:weather_app/core/models/weather_info_entity.dart';

abstract class WeatherRepositoryInterface {
  Future<WeatherInfoEntity> getWeather(double latitude, double longitude);
}
