import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather App',
      routerConfig: Modular.routerConfig,
      theme: ThemeData().copyWith(
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData().textTheme,
        ),
      ),
    );
  }
}
