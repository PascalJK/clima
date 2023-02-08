import 'package:flutter/material.dart';

const String kApiKey = "ae030e51389c33763c74f32490a0fa98";

const String kOpenWeatherMapUrl =
    "https://api.openweathermap.org/data/2.5/weather";

const String kCityBackground = 'assets/images/city_background.jpg';
const String kLocationBackground = 'assets/images/location_background.jpg';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);

const kCityTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 20.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 45.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const double kIconSize = 50.0;

// Can use (Colors.white.withOpacity(.7)) on [fillColor] here.
InputDecoration getTextFieldDecoration() => InputDecoration(
      filled: true,
      fillColor: Colors.white.withOpacity(.7),
      //Temp
      icon: const Icon(
        Icons.location_city,
        color: Colors.white,
      ),
      hintText: "Enter City Name",
      hintStyle: const TextStyle(color: Colors.grey),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none,
      ),
    );

// Can't use (Colors.white.withOpacity(.7)) on [fillColor] here.
const k = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  //Temp
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: "Enter City Name",
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);
