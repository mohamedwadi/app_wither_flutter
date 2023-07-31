import 'package:app_wither_flutter/models/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProviderWeather extends ChangeNotifier{

  WeatherModel? _weatherModel;
  String? cityName;

  set weatherModel(WeatherModel? weatherModel) {
  _weatherModel = weatherModel;
  notifyListeners();
  }

  WeatherModel? get weatherModel => _weatherModel;
}