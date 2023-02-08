import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  static Future getData(Uri uri, Position position) async {
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      print(response.body);
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
