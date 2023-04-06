import 'dart:convert';

class Location {
  String name;
  String? country;
  String? region;
  String? lat;
  String? lon;

  Location({required this.name, this.country, this.region, this.lat, this.lon});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
      name: json["name"],
      country: json["country"],
      region: json["region"],
      lat: json["lat"],
      lon: json["lon"]);
}

Location currentWeatherFromJson(String str) =>
    Location.fromJson(json.decode(str));
