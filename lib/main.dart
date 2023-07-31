import 'package:app_wither_flutter/screen_app/disblay_weather.dart';
import 'package:app_wither_flutter/screen_app/screen_search.dart';
import 'package:flutter/material.dart';
import 'package:app_wither_flutter/raouts/raouts_screen.dart';
import 'package:provider/provider.dart';

import 'models/provider_weather.dart';
import 'models/weather_model.dart';
import 'package:app_wither_flutter/models/provider_weather.dart';
import 'package:app_wither_flutter/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/weather_model.dart';


void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return ProviderWeather();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

   // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    // WeatherModel? weatherModel = Provider.of<ProviderWeather>(context).weatherModel;

    return MaterialApp(
      theme: ThemeData(
        primaryColor:Provider.of<ProviderWeather>(context).weatherModel == null ? Colors.blue
            :Provider.of<ProviderWeather>(context).weatherModel!.getColor(),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 1,
          color:Provider.of<ProviderWeather>(context).weatherModel == null ? Colors.blue :Provider.of<ProviderWeather>(context).weatherModel!.getColor().shade600 ,

      ),
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: WeatherModel == null ? raouts.disblay_weather : raouts.search_screen,
      // routes: {
      //   raouts.search_screen: (context) => Search_screen(),
      //   raouts.disblay_weather: (context) => disblay_weather()
      // },
      home:disblay_weather(),
    );
  }
}
