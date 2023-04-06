// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/dashboard/dashboard_controller.dart';
import 'package:weather_app/screens/allWeather/all_weather.dart';
import 'package:weather_app/screens/home/home.dart';

class DashboardScreen extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController());

  DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
              backgroundColor: Colors.blue,
              body: SafeArea(
                  child: IndexedStack(
                index: controller.tabIndex,
                children: const [
                  Home(),
                  AllWeather(),
                ],
              )),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.blue,
                onTap: controller.changeTabIndex,
                currentIndex: controller.tabIndex,
                unselectedItemColor: Colors.black,
                selectedItemColor: Colors.white,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: [
                  _bottomNavigationBarItem(icon: Icons.cloud, label: 'Météo'),
                  _bottomNavigationBarItem(
                      icon: Icons.list, label: 'Liste Météo'),
                ],
              ),
            ));
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
