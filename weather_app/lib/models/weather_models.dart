// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app/models/main_model.dart';
import 'package:weather_app/models/weather.dart';

class WeatherResponce {
  WeatherResponce({
    required this.weather,
    required this.main,
    required this.name,
  });

  final List<Weather> weather;
  final Main main;
  final String name;

  factory WeatherResponce.fromMap(Map<String, dynamic> map) {
    return WeatherResponce(
      weather: List<Weather>.from(
        (map['weather'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromJson(x as Map<String, dynamic>),
        ),
      ),
      main: Main.fromJson(map['main'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }

  factory WeatherResponce.fromJson(String source) =>
      WeatherResponce.fromMap(json.decode(source) as Map<String, dynamic>);
}
