import 'package:clima/services/location.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final Location _locationService = Location();

  void getLocation() async {
    var pos = await _locationService.getCurrentLocation();
    getData(pos!);
  }

  void getData(Position position) async {
    var url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$kApiKey");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
    }
    print(response.statusCode);
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
