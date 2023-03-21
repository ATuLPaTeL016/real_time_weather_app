import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/WeatherApp/Controllers/AirPollution_Controller.dart';

class AirPollutionWidget extends StatefulWidget {
  const AirPollutionWidget({Key? key}) : super(key: key);

  @override
  State<AirPollutionWidget> createState() => _AirPollutionWidgetState();
}

class _AirPollutionWidgetState extends State<AirPollutionWidget> {
  final AirPollution _airPollutionController = Get.put(AirPollution());

  // This is a Air Pollution Components Name Widget
  Widget buildComponentsName({required String name, required String value}) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 20.0, right: 20, top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ));
  }

  // This is a Air Pollution Name Widget
  Widget buildAirPollutionWidget() {
    return Container(
        alignment: Alignment.center,
        height: 100,
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Air Quality index',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black),
            ),
            Text(
              '${_airPollutionController.aqi}',
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/img/img_1.gif',
                    ),
                    fit: BoxFit.cover)),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: 350,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(5)),
                          child: Image.asset('assets/img/air.jpg',
                              fit: BoxFit.cover)),
                      buildAirPollutionWidget(),
                      const SizedBox(height: 20),
                      buildComponentsName(
                          name: 'CO', value: '${_airPollutionController.co}'),
                      const Divider(color: Colors.black54),
                      buildComponentsName(
                          name: 'NO', value: '${_airPollutionController.no}'),
                      const Divider(color: Colors.black54),
                      buildComponentsName(
                          name: 'NO2', value: '${_airPollutionController.no2}'),
                      const Divider(color: Colors.black54),
                      buildComponentsName(
                          name: 'O3', value: '${_airPollutionController.o3}'),
                      const Divider(color: Colors.black54),
                      buildComponentsName(
                          name: 'SO2', value: '${_airPollutionController.so2}'),
                      const Divider(color: Colors.black54),
                      buildComponentsName(
                          name: 'NH3', value: '${_airPollutionController.nh3}'),
                      const Divider(color: Colors.black54),
                      buildComponentsName(
                          name: 'PM10',
                          value: '${_airPollutionController.pm10}'),
                      const SizedBox(height: 20),
                    ],
                  ),
                ))),
      ),
    );
  }

  aqi() {
    int aqi = 5;
    if (aqi <= 1) {
      print('Good');
    } else if (aqi <= 2) {
      print('Fiar');
    } else if (aqi <= 3) {
      print('Moderate');
    } else if (aqi <= 4) {
      print('Poor');
    } else if (aqi == 5) {
      print('Very Poor');
    } else {
      print('');
    }
  }
}
