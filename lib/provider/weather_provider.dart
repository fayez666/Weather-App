import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherProvider extends ChangeNotifier{
  String? cityName;
  WeatherModel? _weatherData;

  set weatherData(WeatherModel? weather){
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData =>  _weatherData;

}