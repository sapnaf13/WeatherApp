import 'dart:ffi';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sample/Utilities/constants.dart';
import 'package:sample/Services/weather.dart';
import 'CityScreen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  double temperature = 0;
  String weatherIcon = "";
  String cityName = "";
  String weatherMessage = "";
  IconData my_icon = MdiIcons.weatherSunny;
  Color my_color = Colors.amberAccent;
  String description = '';
  double windSpeed = 0;
  int pressure = 0;
  double feelsLike = 0;
  int humidity = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(
      () {
        if (weatherData == null) {
          temperature = 0;
          weatherIcon = 'Error';
          weatherMessage = 'unable to fetch weather data';
          cityName = '';
          description = '';
          windSpeed = 0;
          pressure = 0;
          feelsLike = 0;
          humidity = 0;
          return;
        }
        temperature = weatherData['main']['temp'];
        cityName = weatherData['name'];
        var condition = weatherData['weather'][0]['id'];
        getWeatherIcon(condition);
        weatherMessage = weather.getMessage(condition);
        description = weatherData['weather'][0]['main'];
        windSpeed = weatherData['wind']['speed'];
        pressure = weatherData['main']['pressure'];
        feelsLike = weatherData['main']['feels_like'];
        humidity = weatherData['main']['humidity'];
      },
    );
  }

  void getWeatherIcon(int condition) {
    if (condition < 300) {
      my_icon = MdiIcons.weatherLightning;
      my_color = Colors.brown;
      return;
    } else if (condition < 400) {
      my_icon = MdiIcons.weatherRainy;
      my_color = Colors.indigo.shade400;
      return;
    } else if (condition < 600) {
      my_icon = MdiIcons.weatherRainy;
      my_color = Colors.indigo.shade600;
      return; //'☔️';
    } else if (condition < 700) {
      my_icon = MdiIcons.snowflake;
      my_color = Colors.blue.shade50;
      return; //'☃️';
    } else if (condition < 800) {
      my_icon = MdiIcons.weatherCloudy;
      my_color = Colors.blue.shade50;
      return; //'🌫';
    } else if (condition == 800) {
      my_icon = MdiIcons.weatherSunny;
      my_color = Colors.amberAccent;
      return; // '☀️'; //chnge
    } else if (condition <= 804) {
      my_icon = MdiIcons.weatherCloudy;
      my_color = Colors.indigo.shade100;
      return; // '☁️';
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM, kk:mm').format(now);
    //DateFormat('kk:mm:ss \n EEE d MMM').format(now);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor:
                        Colors.lightBlueAccent.shade400.withOpacity(0.2),
                    child: Icon(
                      Icons.my_location,
                      size: 25,
                      color: Colors.lightBlueAccent.shade400,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '$cityName',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.lightBlueAccent.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 90,
                ),
                Text(
                  formattedDate,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.lightBlueAccent.shade400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              // height: 80,
              // width: 290,
              decoration: BoxDecoration(
                  //  color: Colors.grey.shade800,
                  // border: Border.all(),
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(20),
                  // ),
                  ),
              child: Row(
                children: [
                  SizedBox(
                    width: 80,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            '$temperature°',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                              //  color: Colors.cyan.shade300,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$description',
                        // '$cityName',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w100,
                          // color: Colors.cyan.shade300,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Icon(
                            my_icon,
                            size: 90,
                            color: my_color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    //Colors.grey.shade900,
                    border: Border.all(color: Colors.grey.shade900),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 23,
                          ),
                          Icon(
                            MdiIcons.weatherWindy,
                            size: 50,
                            color: Colors.deepPurple.shade400,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 23,
                              ),
                              Text(
                                'Speed',
                                style: TextStyle(fontSize: 17),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$windSpeed kmph',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 23,
                              ),
                              Text(
                                'Pressure',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '$pressure mb',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: 80,
                //   width: 290,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.shade800,
                //     border: Border.all(),
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(20),
                //     ),
                //   ),
                //   child: Center(
                //     child: Text(
                //       '$weatherMessage',
                //       style: TextStyle(
                //         fontSize: 30,
                //         color: Colors.purple.shade200,
                //         fontFamily: 'Allura',
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 70,
                // ),
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 120,
                        ),
                        Text(
                          'Feels like $feelsLike°',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 130,
                        ),
                        Text(
                          'Humidity $humidity°',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 65,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextButton(
                        onPressed: () async {
                          var weatherData = await weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.refresh,
                              color: Colors.lightBlueAccent.shade400,
                              size: 35,
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlueAccent.shade400
                                .withOpacity(0.20),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: TextButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CityScreen();
                              },
                            ),
                          );
                          if (typedName != null) {
                            var weatherData =
                                await weather.getCityWeather(typedName);
                            updateUI(weatherData);
                          }
                        },
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.lightBlueAccent.shade400,
                              size: 35,
                            ),
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.lightBlueAccent.shade400
                                .withOpacity(0.20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
