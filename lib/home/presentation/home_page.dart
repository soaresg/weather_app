import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/home/home_controller.dart';
import 'package:weather_app/home/presentation/widgets/hourly_weather_widget.dart';
import 'package:weather_app/utils/string_extensions.dart';

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
    const gradientText = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white,
        Colors.transparent,
      ],
    );

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
                  return FutureBuilder(
                    future: controller.todaysWeather(),
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
                            return Stack(
                              children: [
                                Image.asset(
                                  'assets/backgrounds/${controller.currentWeather!.weather.icon.substring(0, 2)}.jpg',
                                  height: MediaQuery.of(context).size.height,
                                  fit: BoxFit.fitHeight,
                                ),
                                Container(
                                  color: Colors.black.withOpacity(0.1),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 64,
                                      left: 16,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.place, size: 12),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child:
                                                  Text(controller.city!.name),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ShaderMask(
                                              shaderCallback: (bounds) =>
                                                  gradientText.createShader(
                                                Rect.fromLTWH(
                                                  0,
                                                  0,
                                                  bounds.width,
                                                  bounds.height,
                                                ),
                                              ),
                                              child: Text(
                                                '${controller.currentWeather!.temperature.temperature.toInt()}º',
                                                style: const TextStyle(
                                                  fontSize: 128,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0),
                                              child: ShaderMask(
                                                shaderCallback: (bounds) =>
                                                    gradientText.createShader(
                                                  Rect.fromLTWH(
                                                    0,
                                                    0,
                                                    bounds.width,
                                                    bounds.height + 75,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Image.network(
                                                      'https://openweathermap.org/img/wn/${controller.currentWeather!.weather.icon}@2x.png',
                                                      scale: 2,
                                                    ),
                                                    RotatedBox(
                                                      quarterTurns: 3,
                                                      child: Text(
                                                        controller
                                                            .currentWeather!
                                                            .weather
                                                            .description
                                                            .capitalize(),
                                                        style: const TextStyle(
                                                          fontSize: 24,
                                                        ),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.elliptical(
                                              MediaQuery.of(context).size.width,
                                              100)),
                                    ),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.horizontal_rule,
                                          color: Colors.black.withOpacity(0.15),
                                          size: 32,
                                        ),
                                        const Text('Weather Today'),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              HourlyWeatherWidget(
                                                weatherInfo: controller
                                                    .hourlyWeather.first!,
                                              ),
                                              HourlyWeatherWidget(
                                                weatherInfo: controller
                                                    .hourlyWeather
                                                    .skip(1)
                                                    .first!,
                                              ),
                                              HourlyWeatherWidget(
                                                weatherInfo: controller
                                                    .hourlyWeather
                                                    .skip(2)
                                                    .first!,
                                              ),
                                              HourlyWeatherWidget(
                                                weatherInfo: controller
                                                    .hourlyWeather
                                                    .skip(3)
                                                    .first!,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        default:
                          return Container();
                      }
                    },
                  );
                }
              default:
                return Container();
            }
          }),
    );
  }
}
