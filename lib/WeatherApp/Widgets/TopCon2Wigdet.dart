import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/WeatherApp/Controllers/weather_controller.dart';

class TopCon2Widget extends StatefulWidget {
  @override
  State<TopCon2Widget> createState() => _TopCon2WidgetState();
}

class _TopCon2WidgetState extends State<TopCon2Widget> {
  final WeatherModel _weatherCont = Get.put(WeatherModel());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.water_drop,
                      size: 30,
                      color: Colors.blue,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Humidity',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${_weatherCont.humidity.value.toInt()} %',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 2,
                      height: 60,
                      color: Colors.black38,
                    )
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.visibility_outlined,
                      size: 25,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Visibility',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${_weatherCont.visibility.value.toInt()} km',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 2,
                      height: 60,
                      color: Colors.black38,
                    )
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.speed_sharp,
                      size: 30,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 5),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Pressure',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${_weatherCont.pressure.value.toInt()} hPa',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Row(
                  children: [
                    const Icon(
                      Icons.air_rounded,
                      size: 30,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Wind',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${_weatherCont.wind.value.toInt()} m/s',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 2,
                      height: 60,
                      color: Colors.black38,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.thermostat,
                      size: 30,
                      color: Colors.blue,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Min Temp',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${_weatherCont.minTemp.value.toInt()} °C',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 2,
                      height: 60,
                      color: Colors.black38,
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.thermostat,
                      size: 30,
                      color: Colors.blue,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Max Temp',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '${_weatherCont.maxTemp.value.toInt()} °C',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
