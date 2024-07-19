import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/home/home_controller.dart';
import 'package:weather_app/home/presentation/home_page.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(HomeController.new);
  }

  @override
  void routes(r) {
    r.child(
      HomeModuleRoutes.homePage,
      child: (context) => const HomePage(),
    );
  }
}

class HomeModuleRoutes {
  static String homePage = '/';
}
