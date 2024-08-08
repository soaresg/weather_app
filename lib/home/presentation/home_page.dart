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

                  return Stack(
                    children: [
                      Container(
                        color: Colors.black.withOpacity(0.1),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 64,
                            left: 16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.place, size: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(controller.city!.name),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${currentWeather!.temperature.temperature.toInt()}º',
                                    style: const TextStyle(
                                      fontSize: 128,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: Row(
                                        children: [
                                          Image.network(
                                            'https://openweathermap.org/img/wn/${currentWeather.weather.icon}@2x.png',
                                            scale: 2,
                                          ),
                                          Text(
                                            currentWeather.weather.main,
                                            style: const TextStyle(
                                              fontSize: 24,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                                top: Radius.elliptical(
                                    MediaQuery.of(context).size.width, 100)),
                          ),
                          height: MediaQuery.of(context).size.height * 0.25,
                        ),
                      ),
                    ],
                  );
                }
              default:
                return Container();
            }
          }),
    );
  }
}
