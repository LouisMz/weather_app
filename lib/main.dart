// Flutter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Widgets
import 'package:weather_app/screens/home.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Weather App (LM)',
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: Home(),
  ));
}
