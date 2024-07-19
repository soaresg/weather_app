import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather_app/home/home_module.dart';
import 'package:weather_app/splash/splash_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      AppModuleRoutes.splashPage,
      child: (context) => const SplashPage(),
    );
    r.module(
      AppModuleRoutes.homeModule,
      module: HomeModule(),
    );
  }
}

class AppModuleRoutes {
  static String splashPage = '/';
  static String homeModule = '/home/';
}
