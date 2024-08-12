import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/app_module.dart';
import 'package:weather_app/core/open_weather_var.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final OpenWeatherVariables openWeatherVariables =
      Modular.get<OpenWeatherVariables>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: openWeatherVariables.getVariables(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Container(
                  color: Colors.orange.withOpacity(0.5),
                );
              case ConnectionState.done:
                Modular.to.navigate(AppModuleRoutes.homeModule);

                return Container(
                  color: Colors.orange.withOpacity(0.5),
                );

              default:
                Container(
                  color: Colors.orange.withOpacity(0.5),
                );
            }
            return Container(
              color: Colors.orange.withOpacity(0.5),
            );
          }),
    );
  }
}
