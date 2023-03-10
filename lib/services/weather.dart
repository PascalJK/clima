import '../utilities/constants.dart';
import 'location.dart';
import 'networking.dart';

class WeatherModel {
  static Future getCityWeather(String cityName) async {
    return await NetworkHelper.getData(Uri.parse(
        "$kOpenWeatherMapUrl?q=$cityName&appid=$kApiKey&units=metric"));
  }

  static Future getLocationWeather() async {
    var position = await Location.getCurrentLocation();
    if (position == null) return {};

    var uri = Uri.parse(
        "$kOpenWeatherMapUrl?lat=${position.latitude}&lon=${position.longitude}&appid=$kApiKey&units=metric");
    return await NetworkHelper.getData(uri);
  }

  static String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  static String getMessage(double temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
