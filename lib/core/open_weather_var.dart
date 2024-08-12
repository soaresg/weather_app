import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OpenWeatherVariables {
  String _openWeatherUrl = '';
  String _apiKey = '';

  final db = FirebaseFirestore.instance;

  String get openWeatherUrl => _openWeatherUrl;
  String get apiKey => _apiKey;

  Future<void> getVariables() async {
    Map<String, dynamic> data = {};

    await db.collection("variables").get().then((event) {
      for (var doc in event.docs) {
        data[doc.id] = doc.data();
      }

      _openWeatherUrl = data['openweather']['url'];
      _apiKey = data['openweather']['apikey'];
    });
  }
}
