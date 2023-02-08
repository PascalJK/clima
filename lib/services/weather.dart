import 'package:flutter/material.dart';

import '../screens/location_screen.dart';
import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  static Future getLocationWeather() async {
    var position = await Location.getCurrentLocation();
    if (position == null) return {};

    var uri = Uri.parse(
        "$kOpenWeatherMapUrl?lat=${position.latitude}&lon=${position.longitude}&appid=$kApiKey&units=metric");
    return await NetworkHelper.getData(uri, position);
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
