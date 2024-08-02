import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/models/weather_info_entity.dart';
import 'package:weather_app/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = Modular.get<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: controller.getWeather(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.done:
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Erro ao buscar a localização atual'),
                  );
                } else {
                  WeatherInfoEntity? currentWeather =
                      controller.todaysWeather();

                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Latitude: ${controller.position!.latitude} \n Longitude: ${controller.position!.longitude}'),
                        const SizedBox(height: 8),
                        Text(
                            'Current Weather: ${currentWeather!.weather.main}'),
                      ],
                    ),
                  );
                }
              default:
                return Container();
            }
          }),
    );
  }
}
