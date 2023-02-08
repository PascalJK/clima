import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final Location _locationService = Location();

  void getLocationData() async {
    var position = await _locationService.getCurrentLocation();
    if (position == null) return;

    var uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$kApiKey&units=metric");
    var data = await NetworkHelper.getData(uri, position);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LocationScreen(locationData: data),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return const Scaffold(
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 150,
        ),
      ),
    );
  }
}
