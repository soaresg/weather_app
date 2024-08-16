import 'package:flutter/material.dart';

class WeatherTodayIconWidget extends StatelessWidget {
  const WeatherTodayIconWidget({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      scale: 1.5,
    );
  }
}
