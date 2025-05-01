import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_weather_api/models/weather_model.dart';

class WeatherService {
  //base url & api key
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  static const String apiKey = '02c02b48840aae3c1811d6a07c550743';

  //get data from url + api key based on city
  Future<WeatherModel> getWeather(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl?q=$city&appid=$apiKey&units=metric'),
    );
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get weather data!');
    }
  }
}
