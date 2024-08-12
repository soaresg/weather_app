import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/core/core_module.dart';
import 'package:weather_app/core/repositories/weather_repository.dart';
import 'package:weather_app/home/home_controller.dart';
import 'package:weather_app/home/presentation/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(i) {
    i.addSingleton(HomeController.new);
    i.addSingleton(WeatherRepository.new);
  }

  @override
  void routes(r) {
    r.child(
      HomeModuleRoutes.homePage,
      child: (context) => HomePage(),
    );
  }
}

class HomeModuleRoutes {
  static String homePage = '/';
}
