import 'package:cloud_firestore/cloud_firestore.dart';

class OpenWeatherVariables {
  String _openHourlyWeatherUrl = '';
  String _openCurrentWeatherUrl = '';
  String _apiKey = '';

  final db = FirebaseFirestore.instance;

  String get openHourlyWeatherUrl => _openHourlyWeatherUrl;
  String get openCurrentWeatherUrl => _openCurrentWeatherUrl;
  String get apiKey => _apiKey;

  Future<void> getVariables() async {
    Map<String, dynamic> data = {};

    await db.collection("variables").get().then((event) {
      for (var doc in event.docs) {
        data[doc.id] = doc.data();
      }

      _openHourlyWeatherUrl = data['openweather']['urlHourly'];
      _openCurrentWeatherUrl = data['openweather']['urlCurrent'];
      _apiKey = data['openweather']['apikey'];
    });
  }
}
