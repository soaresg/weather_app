import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/home/home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get<HomeController>();

  @override
  void initState() {
    controller.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey.withOpacity(0.7),
        child: Center(
          child: ElevatedButton(
            onPressed: () async => await controller.getWeather(),
            child: const Text('Get Current Weather'),
          ),
        ),
      ),
    );
  }
}
