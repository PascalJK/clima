import 'package:geolocator/geolocator.dart';

class Location {
  Future<Position?> getCurrentLocation() async {
    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        throw 'Location services are disabled.';
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        switch (permission) {
          case LocationPermission.denied:
            throw 'Location permissions are denied';
          case LocationPermission.deniedForever:
            throw 'Location permissions where denied more than once would you like to be navigated to app settings to allow app to use your location?';
          //TODO Show user an option to go to their app settings and change permissions.
          default:
            break;
        }
      }
      return await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
