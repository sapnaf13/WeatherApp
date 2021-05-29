import 'package:sample/Services/Location.dart';
import 'package:sample/Services/Networking.dart';

const apiKey = '296ab8fbc52b6f268d6c6e033d7d7bba';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longtitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getMessage(int condition) {
    if (condition < 300) {
      return 'You might need an umbrella'; //storm
    } else if (condition < 400) {
      return 'You might need an umbrella';
    } else if (condition < 600) {
      return 'You might need a raincoat'; //'☔️';
    } else if (condition < 700) {
      return 'Don\'t forget your jacket'; //'☃️';
    } else if (condition < 800) {
      return 'It\'s ice cream time!!'; //'🌫';
    } else if (condition == 800) {
      return 'It\'s ice cream time!!'; // '☀️'; //chnge
    } else if (condition <= 804) {
      return 'It\'s ice cream time!!'; // '☁️';
    }
    return '';
  }
}

String getColor(int condition) {
  if (condition < 300) {
    return 'Colors.grey'; //storm
  } else if (condition < 400) {
    return 'Colors.blue.shade200';
  } else if (condition < 600) {
    return 'Colors.indigo.shade600'; //'☔️';
  } else if (condition < 700) {
    return 'Colors.indigo.shade100'; //'☃️';
  } else if (condition < 800) {
    return 'Colors.blue.shade200'; //'🌫';
  } else if (condition == 800) {
    return ' Colors.amber.shade200'; // '☀️';
  } else if (condition <= 804) {
    return 'Colors.blue.shade100'; // '☁️';
  }
  return 'Colors.blue.shade200';
}
