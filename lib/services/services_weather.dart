import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/services/service_base.dart';

class WeatherService extends BaseService {
  static Future<Weather?>? getCurrentWeather(String city) async {
    http.Response? response = await BaseService.makeRequest(
      '${BaseService.baseUri}current?access_key=${BaseService.apiKey}&query=$city',
      method: 'GET',
    );
    if (response!.statusCode == 200) {
      var data = json.decode(response.body);
      Weather? weather;
      weather = Weather.fromJson(data);
      return weather;
    }
    return null;
  }
}
