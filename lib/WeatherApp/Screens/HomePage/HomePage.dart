

import 'package:flutter/material.dart';
import 'package:weather/WeatherApp/Widgets/AirPollution_Wadget.dart';
import 'package:weather/WeatherApp/Widgets/FiveDayData_Widget.dart';
import 'package:weather/WeatherApp/Widgets/TopCon1Widget.dart';
import 'package:weather/WeatherApp/Widgets/TopCon2Wigdet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final WeatherModel _weatherCont = Get.put(WeatherModel());
  // final FiveDayData _fiveDayDataController = Get.put(FiveDayData());
  // final AirPollution _airPollutionController = Get.put(AirPollution());
  // final HourlyData _hourlyDataController = Get.put(HourlyData());

  Widget buildAirPollutionWidget() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AirPollutionWidget()));
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text(
          'Air Pollution',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18, color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          actions: const [
            Icon(
              Icons.add,
              size: 30,
            )
          ],
          title: const Text(
            'Weather App',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                ),
                child: Center(
                  child: Text(
                    'The Weather App',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                title: Text('Profile', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                title: Text(
                  'Messages',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/img/img_1.gif',
                      ),
                      fit: BoxFit.cover)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 80),
                      const TopCon1Widget(),
                      const SizedBox(height: 20),
                      TopCon2Widget(),
                      const SizedBox(height: 20),
                      buildAirPollutionWidget(),
                      const SizedBox(height: 20),
                      const FivedayDataWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
