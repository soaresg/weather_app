import 'package:flutter/material.dart';
import 'package:weather_app/core/models/weather_info_entity.dart';
import 'package:weather_app/home/presentation/widgets/weather_today_icon_widget.dart';
import 'package:weather_app/home/presentation/widgets/weather_today_temperature_widget.dart';
import 'package:weather_app/home/presentation/widgets/weather_today_time_widget.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({super.key, required this.weatherInfo});

  final WeatherInfoEntity weatherInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeatherTodayIconWidget(
            url:
                'https://openweathermap.org/img/wn/${weatherInfo.weather.icon}@2x.png'),
        WeatherTodayTimeWidget(
          time: weatherInfo.dateTime,
        ),
        WeatherTodayTemperatureWidget(
          temperature: weatherInfo.temperature.temperature.toInt().toString(),
        ),
      ],
    );
  }
}
