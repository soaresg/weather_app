import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/open_weather_var.dart';

class CoreModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(OpenWeatherVariables.new);
  }
}
