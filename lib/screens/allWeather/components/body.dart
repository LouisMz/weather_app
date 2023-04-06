import 'package:flutter/material.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/routes/routes.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final List<Weather> _weathers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: ListView.separated(
        itemCount: _weathers.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(20)),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.cloud, color: Colors.green),
                ),
              ),
              contentPadding: const EdgeInsets.all(8.0),
              title: Text(_weathers[index].location!.name),
              subtitle: Text(
                  '${_weathers[index].currentWeather!.temperature}°C, Ressentie: ${_weathers[index].currentWeather!.feelslike}'),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 0);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () async {
          var weather =
              await Navigator.pushNamed(context, Routes.SearchWeatherViewRoute)
                  as Weather;
          _weathers.add(weather);
          setState(() {});
        },
        label: const Text(
          'Ajouter une Ville',
          style: TextStyle(color: Colors.black),
        ),
        icon: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
