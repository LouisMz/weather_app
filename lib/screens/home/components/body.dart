import 'package:flutter/material.dart';
import 'package:weather_app/models/model_weather.dart';
import 'package:weather_app/services/services_weather.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<Weather?>? _wheather;

  @override
  initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    _wheather = WeatherService.getCurrentWeather('Angers');
  }

  refresh() {
    setState(() {
      _wheather = WeatherService.getCurrentWeather('Angers');
    });
    setState(() {
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: RefreshIndicator(
        onRefresh: getData,
        child: FutureBuilder(
            future: _wheather,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Container(
                        height: 90,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Text(
                              '${snapshot.data?.location?.name}',
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 32),
                            ),
                            Text(
                              '${snapshot.data?.currentWeather?.temperature} °C',
                              style: const TextStyle(fontSize: 40),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 0,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Pays:\n${snapshot.data?.location?.country}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            Text(
                              'Région:\n${snapshot.data?.location?.region}',
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 80,
                        width: 370,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Vitesse du vent:\n${snapshot.data?.currentWeather?.windSpeed}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            Text(
                              'Direction du vent:\n${snapshot.data?.currentWeather?.windDir}',
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 80,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Température du vent:\n${snapshot.data?.currentWeather?.windSpeed}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            Text(
                              'Humidité:\n${snapshot.data?.currentWeather?.windDir}',
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 80,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Ressentie:\n${snapshot.data?.currentWeather?.feelslike}',
                              style: const TextStyle(fontSize: 22),
                            ),
                            Text(
                              'Pression:\n${snapshot.data?.currentWeather?.pressure}',
                              style: const TextStyle(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 90,
                        width: 110,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Indice UV:\n${snapshot.data?.currentWeather?.uvIndex}',
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
