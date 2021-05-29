import 'package:flutter/material.dart';
import 'LocationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sample/Services/weather.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    getLocationData();
  }

  void getLocationData() async {
    print('in getloc method');
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(
            locationWeather: weatherData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 350,
          ),
          Row(
            children: [
              SizedBox(
                width: 100,
              ),
              Text(
                'W',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white38,
                ),
              ),
              Text(
                'E',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blueAccent.shade100,
                ),
              ),
              Text(
                'A',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.yellowAccent.shade100,
                ),
              ),
              Text(
                'T',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.greenAccent.shade100,
                ),
              ),
              Text(
                'H',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.redAccent.shade100,
                ),
              ),
              Text(
                'E',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.orangeAccent.shade100,
                ),
              ),
              Text(
                'R',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.purpleAccent.shade100,
                ),
              ),
              Text(
                'L',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.brown,
                ),
              ),
              Text(
                'Y',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
