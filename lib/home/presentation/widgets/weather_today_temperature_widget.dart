import 'package:flutter/material.dart';

class WeatherTodayTemperatureWidget extends StatelessWidget {
  const WeatherTodayTemperatureWidget({super.key, required this.temperature});

  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$temperatureº',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
