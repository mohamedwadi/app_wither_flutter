import 'package:flutter/material.dart';

class WeatherModel {
  String? date;
  double? temp;
  double? maxTemp;
  double? minTemp;
  String? weatherStateName;
  String? icons;

  WeatherModel({required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.icons});

  factory WeatherModel.fromJeson(dynamic data) {
    var jesonDAta = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jesonDAta['avgtemp_c'],
        maxTemp: jesonDAta['maxtemp_c'],
        minTemp: jesonDAta['mintemp_c'],
        weatherStateName: jesonDAta['condition']['text'],
        icons: jesonDAta['condition']['icon']
    );
  }

  MaterialColor getColor() {
    if (weatherStateName == 'Patchy rain possible') {
      return Colors.blue;
    } else if (weatherStateName == 'Sunny' || weatherStateName == 'Clear' ||
        weatherStateName == 'Light Cloud') {
      return Colors.orange;
    }else if (weatherStateName == 'Heavy Cloud' || weatherStateName == 'Heavy Rain'
        || weatherStateName == 'Shower') {
      return Colors.blueGrey;
    }
    else {
      return Colors.blue;
    }
  }
}