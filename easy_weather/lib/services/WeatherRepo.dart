import 'dart:convert';

import 'package:easy_weather/model/weatherModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class WeatherRepo {
  WeatherRepo();

  Future<WeatherModel> getWeather() async {
    Position position = await Geolocator() // get position
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    String url = 'http://api.openweathermap.org/data/2.5/weather?lat=' +
        position.latitude.toString() +
        '&lon=' +
        position.longitude.toString() +
        '&appid=439d4b804bc81807953eb36d2a80c26a0';

    final result = await http.Client().get(url);
    if (result.statusCode != 200) throw Exception();
    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    return WeatherModel.fromJson(jsonDecoded);
  }
}
