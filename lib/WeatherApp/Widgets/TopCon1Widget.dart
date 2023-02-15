import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather/WeatherApp/Controllers/geo_location_controller.dart';
import 'package:weather/WeatherApp/Controllers/weather_controller.dart';


class TopCon1Widget extends StatefulWidget {
  const TopCon1Widget({Key? key}) : super(key: key);

  @override
  State<TopCon1Widget> createState() => _TopCon1WidgetState();
}

class _TopCon1WidgetState extends State<TopCon1Widget> {
  final WeatherModel _weatherCont = Get.put(WeatherModel());
  final LocationController _locationCon = Get.put(LocationController());
  String date = DateFormat('yMMMMd').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 30,
                ),
                Text(
                  _locationCon.address.value,
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${_weatherCont.temperature.value.toInt()}°C ',
                  style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 70),
                ),
                SizedBox(
                  width: 80,
                  height: 80,
                  child: Image.network(
                    _weatherCont.icon.value,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _weatherCont.weatherDescription.value,
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Updated: ${date}',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87),
                ),
                const SizedBox(height: 20)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
