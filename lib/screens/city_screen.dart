import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(kCityBackground),
            fit: BoxFit.cover,
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: kIconSize,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    decoration: getTextFieldDecoration(),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Get Weather',
                    style: kButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
