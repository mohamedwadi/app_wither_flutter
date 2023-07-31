import 'package:app_wither_flutter/main.dart';
import 'package:app_wither_flutter/models/provider_weather.dart';
import 'package:app_wither_flutter/models/weather_model.dart';
import 'package:app_wither_flutter/request_api/weather_srvice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search_screen extends StatefulWidget {
  Search_screen({Key? key}) : super(key: key);

  @override
  State<Search_screen> createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('weather city'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "serach the city wither",
            style: TextStyle(
              color: Colors.orange,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 30,
            ),
            child: TextField(
              onChanged: (data) {
                cityName = data;
              },
              onSubmitted: (data) async {
                cityName = data;
                WeatherService weatherService = WeatherService();
                WeatherModel weatherModel =
                    await weatherService.getWeater(cityName: cityName!);
                Provider.of<ProviderWeather>(context, listen: false)
                    .weatherModel = weatherModel;
                Provider.of<ProviderWeather>(context, listen: false).cityName =
                    cityName;
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      WeatherService weatherService = WeatherService();
                      WeatherModel weatherModel =
                          await weatherService.getWeater(cityName: cityName!);
                      Provider.of<ProviderWeather>(context, listen: false)
                          .weatherModel = weatherModel;
                      Provider.of<ProviderWeather>(context, listen: false)
                          .cityName = cityName;
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.search)),
                border: const OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                label: const Text('search'),
                hintText: 'enter the city',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
