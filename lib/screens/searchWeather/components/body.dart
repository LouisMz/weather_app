import 'package:flutter/material.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/services/services_weather.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController weatherController = TextEditingController();
    Future<Weather?>? weatheradd;
    String weather = weatherController.text;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 120, right: 8.0, left: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: weatherController,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    label: Text('Nouvelle ville'),
                    labelStyle: TextStyle(color: Colors.black),
                    icon: Icon(
                      Icons.cloud_circle,
                      color: Colors.black,
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Entrer du text';
                    }
                    return null;
                  },
                  onChanged: (value) => weather = value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (weather.toString().isNotEmpty) {
                      weatheradd = WeatherService.getCurrentWeather(weather);

                      Navigator.pop(context, weatheradd);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: const Text('Valider'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
