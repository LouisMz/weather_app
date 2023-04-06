import 'dart:convert';

import 'package:weather_app/models/model_currentWeather.dart';
import 'package:weather_app/models/model_location.dart';

class Weather {
  Location? location;
  CurrentWeather? currentWeather;

  Weather({this.location, this.currentWeather});

  factory Weather.fromJson(Map<String, dynamic> json) =>
      Weather(location: Location.fromJson(json["location"]), currentWeather: CurrentWeather.fromJson(json["current"]));
}

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
