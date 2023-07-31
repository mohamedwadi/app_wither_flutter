import 'package:app_wither_flutter/models/provider_weather.dart';
import 'package:app_wither_flutter/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen_search.dart';

class disblay_weather extends StatefulWidget {
  disblay_weather({Key? key});

  @override
  State<disblay_weather> createState() => _disblay_weatherState();
}

class _disblay_weatherState extends State<disblay_weather> {
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        Provider.of<ProviderWeather>(context).weatherModel;
    String? cityName =
        Provider.of<ProviderWeather>(context, listen: true).cityName;
    // WeatherModel? weatherModel = WeatherModel(date: "date", temp: 1  , maxTemp: 5, minTemp: 3, weatherStateName: 'weatherStateName');

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Search_screen()));
            },
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
          ),
        ),
        body: weatherModel != null
            ? Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    // gradint from color to color
                    gradient: LinearGradient(
                  colors: [
                    weatherModel.getColor().shade700,
                    weatherModel.getColor().shade500,
                    weatherModel.getColor().shade300
                  ],
                  // where bigin the color
                  begin: AlignmentDirectional.topStart,
                  //where end the color
                  end: AlignmentDirectional.bottomEnd,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 4,
                    ),
                    Column(
                      children: [
                        Text(
                          '$cityName',
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${weatherModel?.date}',
                          style: const TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    SizedBox(
                      height: 100,
                      //margin: EdgeInsets.only(left: ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 70.0,
                            backgroundImage:
                                NetworkImage('https:${weatherModel.icons}'),
                            backgroundColor: Colors.transparent,
                          ),
                          Text(
                            '${weatherModel?.temp}',
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'max temp : ${weatherModel.maxTemp!.toInt()}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'min temp : ${weatherModel.minTemp!.toInt()}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      '${weatherModel?.weatherStateName}',
                      style:
                          const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 4,
                    )
                  ],
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 50),
                      width: double.infinity,
                      child: const Text(
                        'No weather now please search to state weather',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
