import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.locationData});

  final Map locationData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double temperature = 0;
  String city = "";
  String weatherIcon = "";
  String weatherMessage = "";

  void updateUI(Map weatherData) {
    if (weatherData.isEmpty) {
      setState(() {
        weatherMessage = "Failed to get updated weather info";
      });
      return;
    }
    setState(() {
      temperature = double.parse(weatherData["main"]["temp"].toString());
      city = weatherData["name"];
      weatherIcon =
          WeatherModel.getWeatherIcon(weatherData["weather"][0]["id"]);
      weatherMessage = WeatherModel.getMessage(temperature);
    });
  }

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(kLocationBackground),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(.9), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 15, right: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        updateUI(await WeatherModel.getLocationWeather());
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: kIconSize,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.location_city,
                        size: kIconSize,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${temperature.toStringAsFixed(1)}°",
                            style: kTempTextStyle,
                          ),
                          Text(
                            weatherIcon,
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                      Text(
                        "City: $city",
                        style: kCityTextStyle,
                      ),
                    ],
                  ),
                ),
                Text(
                  weatherMessage,
                  style: kMessageTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
