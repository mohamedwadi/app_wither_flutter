
import 'dart:convert';

import '../models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService{

  String base_url = 'http://api.weatherapi.com/v1';

  String api_kay = 'c4684cea8b4f427b850130724233007';

  Future<WeatherModel> getWeater({required String cityName}) async{
    Uri url = Uri.parse('$base_url/forecast.json?key=$api_kay&q=$cityName&days=7');

    http.Response response = await http.get(url);
    Map<String , dynamic> data = jsonDecode(response.body);

    WeatherModel weatherModel  = WeatherModel.fromJeson(data);

    return weatherModel;


  }



}