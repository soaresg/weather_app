import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherTodayTimeWidget extends StatelessWidget {
  const WeatherTodayTimeWidget({super.key, required this.time});

  final DateTime time;

  @override
  Widget build(BuildContext context) {
    final timeFormat = DateFormat('HH:mm');

    return Text(
      timeFormat.format(
        time.subtract(
          const Duration(hours: 3),
        ),
      ),
      style: TextStyle(
        color: Colors.grey.withOpacity(0.9),
        fontSize: 10,
      ),
    );
  }
}
