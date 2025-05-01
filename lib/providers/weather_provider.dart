import 'package:flutter/material.dart';
import 'package:learn_weather_api/models/weather_model.dart';
import 'package:learn_weather_api/utils/http/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  //variables
  WeatherModel? _weather;
  bool _isLoading = false;
  String? _error;

  //getter (to use the variables outside this file)
  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get error => _error;

  //instances (to call a function outside this file)
  final WeatherService _weatherService = WeatherService();

  //process data from 3rd party source to UI
  Future<void> fetchWeather(String city) async {
    //declare what variable is going to changed
    _isLoading = true;
    _error = null;
    notifyListeners();

    //try to get weather data, catch error, and finally stop loading
    try {
      _weather = await _weatherService.getWeather(city);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
