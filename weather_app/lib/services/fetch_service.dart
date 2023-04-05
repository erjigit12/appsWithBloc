import 'dart:developer';

import 'package:http/http.dart ' as http;
import 'package:weather_app/constants/const_api.dart';
import 'package:weather_app/models/weather_models.dart';

class WeatherService {
  final client = http.Client();

  Future<WeatherResponce?> getWeatherByCityName(String cityName) async {
    final uri = Uri.parse(ApiConst.weatherByCityName(cityName));

    try {
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final weather = WeatherResponce.fromJson(response.body);
        return weather;
      } else {
        log('response.statuscode: ${response.body}');
        return null;
      }
    } catch (e) {
      log('getWeatherByCityName is incorrect $e');
      return null;
    }
  }
}

final weatherService = WeatherService();
