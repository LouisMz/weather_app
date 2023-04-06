// ignore_for_file: file_names

import 'dart:convert';

class CurrentWeather {
  int? temperature;
  int? windSpeed;
  int? windDegree;
  String? windDir;
  int? pressure;
  int? humidity;
  int? feelslike;
  int? uvIndex;

  CurrentWeather(
      {this.temperature,
      this.windSpeed,
      this.windDegree,
      this.windDir,
      this.pressure,
      this.humidity,
      this.feelslike,
      this.uvIndex});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
      temperature: json["temperature"],
      windSpeed: json["wind_speed"],
      windDegree: json["wind_degree"],
      windDir: json["wind_dir"],
      pressure: json["pressure"],
      humidity: json["humidity"],
      feelslike: json["feelslike"],
      uvIndex: json["uv_index"]);
}

CurrentWeather currentWeatherFromJson(String str) =>
    CurrentWeather.fromJson(json.decode(str));
